//
//  ViewController.m
//  03-多线程group
//
//  Created by chenxiaojie on 2021/9/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/** 完成需求：在子线程同时执行两个任务，等待两个任务全都结束之后再执行任务3 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务 1 - %@", [NSThread currentThread]);
        }
    });
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务 2 - %@", [NSThread currentThread]);
        }
    });
    
    // 任务1、任务2执行结束之后，回到主线程执行任务3
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"任务 3 - %@", [NSThread currentThread]);
        }
    });
    
    
//    dispatch_group_notify(group, queue, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务 3 - %@", [NSThread currentThread]);
//        }
//    });
//
//    dispatch_group_notify(group, queue, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务 4 - %@", [NSThread currentThread]);
//        }
//    });
}

@end
