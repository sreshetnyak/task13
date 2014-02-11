//
//  TTStudent.h
//  Multithreading
//
//  Created by sergey on 2/7/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^TTStudentBlock)(NSString *str);

@interface TTStudent : NSObject

@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) NSInteger number;
@property (assign,nonatomic) NSInteger range;

+ (dispatch_queue_t)sharedInstance;

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range;
- (void)startTask;
- (void)startTaskWithBlock:(TTStudentBlock)block;

@end
