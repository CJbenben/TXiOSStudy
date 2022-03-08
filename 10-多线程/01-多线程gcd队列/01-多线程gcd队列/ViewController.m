//
//  ViewController.m
//  09-多线程gcd队列
//
//  Created by chenxiaojie on 2021/9/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)interview01 {
    // 以下代码在主线程中执行，会不会产生死锁？会
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 同步，又在主线程执行，所以会阻塞
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
}

- (void)interview02 {
    // 以下代码在主线程中执行，会不会产生死锁？不会
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 异步，所以不会阻塞。会等待任务3执行完之后再执行任务2
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
}

- (void)interview03 {
    // 以下代码在串行队列中执行，会不会产生死锁？不会
    NSLog(@"执行任务1");
    
    // 串行队列
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    // 同步，不会开启新的线程，还是在主线程执行
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2 %@", [NSThread currentThread]);
    });
    
    NSLog(@"执行任务3 %@", [NSThread currentThread]);
}

- (void)interview04 {
    // 以下代码在串行队列中执行，会不会产生死锁？会
    NSLog(@"执行任务1");
    
    // 串行队列
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"执行任务2 %@", [NSThread currentThread]);
        
        dispatch_sync(queue, ^{
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview05 {
    // 以下代码在串行队列中执行，会不会产生死锁？不会
    NSLog(@"执行任务1");
    
    // 串行队列
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    // 并行队列
    dispatch_queue_t queue2 = dispatch_queue_create("myqueue2", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"执行任务2 %@", [NSThread currentThread]);
        
        dispatch_sync(queue2, ^{
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview06 {
    // 以下代码在串行队列中执行，会不会产生死锁？不会
    NSLog(@"执行任务1");
    
    // 串行队列
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    // 串行队列
    dispatch_queue_t queue2 = dispatch_queue_create("myqueue2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"执行任务2 %@", [NSThread currentThread]);
        
        dispatch_sync(queue2, ^{
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)interview07 {
    // 以下代码在串行队列中执行，会不会产生死锁？不会
    NSLog(@"执行任务1");
    
    // 并行队列
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"执行任务2 %@", [NSThread currentThread]);
        
        dispatch_sync(queue, ^{
            NSLog(@"执行任务3 %@", [NSThread currentThread]);
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self interview07];
    
    /** 什么时候会产生死锁
     总结：在使用 sync 函数 向当前串行队列中添加任务，会卡住当前的串行队列（产生死锁）
     必须同时满足两个条件  使用 sync 函数，串行队列
     */
}


@end
