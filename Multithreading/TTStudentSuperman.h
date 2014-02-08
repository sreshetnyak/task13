//
//  TTStudentSuperman.h
//  Multithreading
//
//  Created by sergey on 2/8/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTStudentSuperman : NSObject

@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) NSInteger number;
@property (assign,nonatomic) NSInteger range;

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range;

@end
