//
//  TTViewController.m
//  Multithreading
//
//  Created by sergey on 2/7/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTStudent.h"

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark - Level Pupil
//    Ученик.
//    
//    1. Создайте класс студент. У него должен быть метод - угадать ответ :)
//    2. В метод передается случайное целое число например в диапазоне от 0 - 100 (или больше) и сам диапазон, чтобы студент знал где угадывать
//    3. Студент генерирует случайное число в том же диапазоне пока оно не будет искомым
//    4. Весь процесс угадывания реализуется в потоке в классе студент
//    5. Когда студент досчитал то пусть пишет в НСЛог
//    6. Создайте 5 студентов и дайте им одну и туже задачу и посмотрите кто справился с ней лучше
    
    TTStudent *student1 = [[TTStudent alloc]initWithName:@"Sergey" guessTheNumber:600454 range:1000000];
    TTStudent *student2 = [[TTStudent alloc]initWithName:@"Viktor" guessTheNumber:10 range:10000];
    TTStudent *student3 = [[TTStudent alloc]initWithName:@"Vladimer" guessTheNumber:256 range:10000];
    TTStudent *student4 = [[TTStudent alloc]initWithName:@"Aleksey" guessTheNumber:8500 range:10000];
    TTStudent *student5 = [[TTStudent alloc]initWithName:@"Aleksander" guessTheNumber:1200 range:10000];
    
    [student1 startTask];
    [student2 startTask];
    [student3 startTask];
    [student4 startTask];
    [student5 startTask];
    
#pragma mark - Level Student
//    Студент.
//    
//    7. Задача та же, но вместе с условием передавайте студенту блок, в котором вы и объявите результаты
//    8. Блок должен определяться в томже классе, где и определялись студенты
//    9. Блок должен быть вызван на главном потоке
    
    TTStudent *student6 = [[TTStudent alloc]initWithName:@"Andrey" guessTheNumber:25 range:100];
    TTStudent *student7 = [[TTStudent alloc]initWithName:@"Vitaliy" guessTheNumber:10 range:100];
    TTStudent *student8 = [[TTStudent alloc]initWithName:@"Maksim" guessTheNumber:90 range:100];
    TTStudent *student9 = [[TTStudent alloc]initWithName:@"Arthur" guessTheNumber:85 range:100];
    TTStudent *student10 = [[TTStudent alloc]initWithName:@"Georgiy" guessTheNumber:1 range:100];
    
    [student6 startTaskWithBlock:^(NSString *str) {
        if ([NSThread isMainThread]) {
            NSLog(@"%@",str);
        }
    }];
    
    [student7 startTaskWithBlock:^(NSString *str) {
        if ([NSThread isMainThread]) {
            NSLog(@"%@",str);
        }
    }];
    
    [student8 startTaskWithBlock:^(NSString *str) {
        if ([NSThread isMainThread]) {
            NSLog(@"%@",str);
        }
    }];
    
    [student9 startTaskWithBlock:^(NSString *str) {
        if ([NSThread isMainThread]) {
            NSLog(@"%@",str);
        }
    }];
    
    [student10 startTaskWithBlock:^(NSString *str) {
        if ([NSThread isMainThread]) {
            NSLog(@"%@",str);
        }
    }];
    
#pragma mark - Level Master
//    Мастер.
//    
//    10. Создать приватный метод класса (да да, приватный метод да еще и с плюсом), который будет возвращать статическую (то есть одну на все объекты класса студент) dispatch_queue_t, которая инициализируется при первом обращении к этому методу.
//    11. Лучше в этом методе реализовать блок dispatch_once, ищите в инете как и зачем :) А что, программист всегда что-то ищет и хороший программист всегда находит.
//    12. Все студенты должны выполнять свои процессы в этой queue и она должна быть CONCURRENT, типа все блоки одновременно выполняются
    
    
    
    
#pragma mark - Level Superman
//    Супермен.
//    
//    13. Добавьте еще один класс студента, который делает все тоже самое что вы реализовали до этого, только вместо GCD он использует NSOperation и NSOperationQueue. Вообще вынос мозга в самостоятельной работе :)
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
