//
//  TTStudent.m
//  Multithreading
//
//  Created by sergey on 2/7/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTStudent.h"

#define THREAD_COUNT 20

@interface TTStudent ()
@property (strong,nonatomic) NSMutableArray *threadArray;
@property (assign,nonatomic) double startTime;

@end

@implementation TTStudent

+ (dispatch_queue_t)sharedInstance {
    
    static dispatch_once_t task;
    static dispatch_queue_t queue;
    dispatch_once(&task, ^{
        queue = dispatch_queue_create("art.multithreading", DISPATCH_QUEUE_CONCURRENT);
    });

    return queue;
}

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range {
    
    if (self = [super init]) {
        _name = name;
        _number = number;
        _range = range;
    }
    return self;
}

- (void)startTask {
    
    self.startTime = CACurrentMediaTime();
    
    int rangeThread = self.range / THREAD_COUNT;
    
    int startPoint = 0;
    
    int endPoint = rangeThread;
    
    self.threadArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < THREAD_COUNT; i++) {
        
        NSRange threadRange = {startPoint,endPoint};
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(guessTheNumberThread:) object:[NSValue valueWithRange:threadRange]];
        thread.name = [NSString stringWithFormat:@"%@ %d",self.name, i];
        @synchronized (self.threadArray) {
            [self.threadArray addObject:thread];
        }
        [thread start];
        startPoint = startPoint + rangeThread;
        endPoint = endPoint + rangeThread;
    }

}

- (void)guessTheNumberThread:(NSValue *)threadObj {
    
    NSRange range = [threadObj rangeValue];
    NSMutableArray *temp = self.threadArray;
    for (int i = range.location; i < range.length; i++) {
        if (i == self.number) {
            NSLog(@"%@ found number, number equals %d during = %f",self.name, i, CACurrentMediaTime() - self.startTime);
            
            @synchronized (self.threadArray) {
                for (NSThread *thread in temp) {
                        [thread cancel];
                        NSLog(@"%@ is cancel",thread.name);
                }

            }
        }
    }
}

- (void)startTaskWithBlock:(studentBlock)block {
    
    self.startTime = CACurrentMediaTime();
    
    int rangeThread = self.range / THREAD_COUNT;
    
    int startPoint = 0;
    
    int endPoint = rangeThread;
    
    for (int i = 0; i < THREAD_COUNT; i++) {
        
        NSRange threadRange = {startPoint,endPoint};
        
        dispatch_async([TTStudent sharedInstance], ^{
            for (int i = threadRange.location; i < threadRange.length; i++) {
                if (i == self.number) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        block([NSString stringWithFormat:@"%@ found number, number equals %d during = %f",self.name, i, CACurrentMediaTime() - self.startTime]);
                    });
                }
            }
            
        });
        startPoint = startPoint + rangeThread;
        endPoint = endPoint + rangeThread;
    }

    
}

@end
