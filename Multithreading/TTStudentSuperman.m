//
//  TTStudentSuperman.m
//  Multithreading
//
//  Created by sergey on 2/8/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTStudentSuperman.h"

#define THREAD_COUNT 20

@interface TTStudentSuperman ()

@property (assign,nonatomic) double startTime;

@end

@implementation TTStudentSuperman

+ (NSOperationQueue *)sharedInstance {

    static dispatch_once_t task;
    static NSOperationQueue *operationQueue = nil;
    dispatch_once(&task, ^{
        operationQueue = [[NSOperationQueue alloc]init];
    });
    
    return operationQueue;

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
    
    for (int i = 0; i < THREAD_COUNT; i++) {
        
        NSRange threadRange = {startPoint,endPoint};
        
        NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operation:) object:[NSValue valueWithRange:threadRange]];
        [[TTStudentSuperman sharedInstance]addOperation:operation];
        startPoint = startPoint + rangeThread;
        endPoint = endPoint + rangeThread;
    }
    
}

- (void)operation:(NSValue *)threadObj {
    
    NSRange range = [threadObj rangeValue];
    for (int i = range.location; i < range.length; i++) {
        if (i == self.number) {
            NSLog(@"%@ found number, number equals %d during = %f",self.name, i, CACurrentMediaTime() - self.startTime);
            
        }
    }
}


@end
