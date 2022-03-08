//
//  ViewController.m
//  09-读写安全-pthread_rwlock
//
//  Created by chenxiaojie on 2021/10/12.
//

#import "ViewController.h"
#import <pthread/pthread.h>

@interface ViewController ()

@property (nonatomic, assign) pthread_rwlock_t lock;

@end

@implementation ViewController

/* 如何完成 多读单写 的需求？？*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    pthread_rwlock_init(&_lock, NULL);
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void)read {
    
    pthread_rwlock_rdlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)write {
    pthread_rwlock_wrlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

@end
