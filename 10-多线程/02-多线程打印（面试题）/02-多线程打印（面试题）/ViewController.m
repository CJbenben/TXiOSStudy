//
//  ViewController.m
//  02-多线程打印（面试题）
//
//  Created by chenxiaojie on 2021/9/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 问题2：viewDidLoad 执行结束打印结果如何？1、2、3
        原因：在主线程执行就没有问题，因为 主线程是存在 RUNLoop
     */
    NSLog(@"1");
    [self performSelector:@selector(test) withObject:nil afterDelay:.0];
    NSLog(@"3");
    
}

- (void)test {
    NSLog(@"2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self interview02];
}

- (void)interview02 {
    /**  问题3：以下代码执行的结果是什么？会不会崩溃？    1、会崩溃
     原因：在子线程执行 performSelector:onThread:withObject:waitUntilDone: 方法的时候 子线程已经退出了，所以就崩溃了
     */
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");
        
        
        // 解决方案：让子线层保活，就不会崩溃了
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//
//        NSLog(@"end");
    }];
    [thread start];
    
    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
}


- (void)interview01 {
    /** 问题1：点击屏幕打印结果是什么？  1、3
        原因：performSelector:withObject:afterDelay:的实现逻辑，是向 runloop 中添加一个定时器
        而子线程默认是没有 runloop 的
     */
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
            
        NSLog(@"1");
        
        // 这句代码实现逻辑在 runloop 中， 可参考 gnustep 计划中 Foundation 源码
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        
        // 这句代码的实现逻辑: objcmessageSend(self, @selector(test)) 参考 runtime 源码
//        [self performSelector:@selector(test) withObject:nil];
        //[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"3");
    });
}


@end
