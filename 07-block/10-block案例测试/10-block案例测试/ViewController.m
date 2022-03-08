//
//  ViewController.m
//  10-block案例测试
//
//  Created by chenxiaojie on 2021/7/31.
//

#import "ViewController.h"
#import "TXPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TXPerson *person = [[TXPerson alloc] init];
    person.age = 10;
    
    __weak TXPerson *weakPerson = person;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"person.age = %d", person.age);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"person.age = %d", weakPerson.age);
        });
    });
    NSLog(@"------------");
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    TXPerson *person = [[TXPerson alloc] init];
//    person.age = 10;
//
//    __weak TXPerson *weakPerson = person;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"person.age = %d", person.age);
//    });
//    NSLog(@"------------");
//}

@end
