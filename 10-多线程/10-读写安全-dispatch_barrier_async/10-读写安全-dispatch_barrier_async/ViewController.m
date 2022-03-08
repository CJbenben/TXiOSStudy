//
//  ViewController.m
//  09-读写安全-pthread_rwlock
//
//  Created by chenxiaojie on 2021/10/12.
//

#import "ViewController.h"
#import <pthread/pthread.h>

@interface ViewController ()

@end

@implementation ViewController

/* 如何完成 多读单写 的需求？？*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // dispatch_barrier_async 函数的队列必须自己创建，使用 global 队列是无效的
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<10; i++) {
        
        dispatch_async(queue, ^{
            [self read];
        }); 
        
        dispatch_barrier_async(queue, ^{
            [self write];
        });
    }
}

- (void)read {
    sleep(1);
    NSLog(@"%s", __func__);
}

- (void)write {
    sleep(1);
    NSLog(@"%s", __func__);
}

@end
