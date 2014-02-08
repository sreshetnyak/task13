//
//  TTStudentSuperman.m
//  Multithreading
//
//  Created by sergey on 2/8/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTStudentSuperman.h"

@implementation TTStudentSuperman

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range {
    
    if (self = [super init]) {
        _name = name;
        _number = number;
        _range = range;
    }
    return self;
}


@end
