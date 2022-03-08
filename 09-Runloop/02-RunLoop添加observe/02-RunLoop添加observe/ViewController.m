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

void observeRunLoopActivitys (CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry");
            break;
            
        case kCFRunLoopBeforeTimers:
            NSLog(@"kCFRunLoopBeforeTimers");
            break;
            
        case kCFRunLoopBeforeSources:
            NSLog(@"kCFRunLoopBeforeSources");
            break;
            
        case kCFRunLoopBeforeWaiting:
            NSLog(@"kCFRunLoopBeforeWaiting");
            break;
            
        case kCFRunLoopAfterWaiting:
            NSLog(@"kCFRunLoopAfterWaiting");
            break;
            
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit");
            break;
            
            
        default:
            break;
    }
}

/** 向 runloop 中添加 observe 窥探 runloop 的状态变化 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建 observe
    CFRunLoopObserverRef observerRef = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities/* 监听状态 */, YES, 0, observeRunLoopActivitys, NULL);
    // kCFRunLoopCommonModes 通用模式 包含了 kCFRunLoopDefaultMode、UITrackingRunLoopMode
    // 添加 observe 到 runloop 中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observerRef, kCFRunLoopCommonModes);
    CFRelease(observerRef);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 执行 NSLog 代码之前会先执行 kCFRunLoopBeforeSources，因为 touchesBegan 方法为触摸方法，是 mode 里面的 source0 触发的
    NSLog(@"%s", __func__);
    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        // 执行以下代码之前， runloop 处于睡觉状态（kCFRunLoopBeforeWaiting），需要执行 NSLog 代码时，会唤醒 runloop （kCFRunLoopAfterWaiting）
        NSLog(@"------- 定时器 ----------");
    }];
}

@end
