//
//  ViewController.m
//  01-认识RunLoop
//
//  Created by chenxiaojie on 2021/9/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // CFRunLoopRef 是 C 语言的 runloop， NSRunLoop 是对 CFRunLoopRef 的一种封装
//    NSRunLoop *runloop;
//    CFRunLoopRef runloop2;
    
    
    // 拿到当前线程
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    CFRunLoopRef runloop2 = CFRunLoopGetCurrent();
    
    
    NSLog(@"%p %p", [NSRunLoop currentRunLoop], [NSRunLoop mainRunLoop]);
    NSLog(@"%p %p", CFRunLoopGetCurrent, CFRunLoopGetMain());
    
    NSLog(@"%@", [NSRunLoop mainRunLoop]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
}

@end
