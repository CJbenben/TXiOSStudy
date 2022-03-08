//
//  ViewController.m
//  08-读写安全简介
//
//  Created by chenxiaojie on 2021/10/12.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     满足1：在读的同时不允许写，在写的时候不允许读
     可通过线程同步方案执行
     */
    
    self.semaphore = dispatch_semaphore_create(1);
    
    for (int i = 0; i<5; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(read) object:nil] start];
        [[[NSThread alloc] initWithTarget:self selector:@selector(write) object:nil] start];
    }
}

- (void)read {
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    dispatch_semaphore_signal(self.semaphore);
}

- (void)write {
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    dispatch_semaphore_signal(self.semaphore);
}


/*
 虽然以上方案可以完成需求1，但是还是可以优化
 因为读取的过程不会改变数据，固有以下需求：
 同一时间，只有一条线程进行写的操作
 同一时间，允许多条线程进行读的操作
 同一时间，不允许既有写，又有读的操作
 完成以上需求可参考 09-读写安全-pthread_rwlock\10-读写安全-dispatch_barrier_async
 */

@end
