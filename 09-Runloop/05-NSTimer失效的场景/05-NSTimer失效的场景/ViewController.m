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
    
    
    //[self test];
    [self test2];
}

// runloop解决 NSTimer 失效的问题
- (void)test2 {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 通用模式（NSRunLoopCommonModes），并不是正式存在的模式，只是一个标记
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

/**
    定时器失效的问题
    原因：这是因为 NSTimer 只在  kCFRunLoopDefaultMode 下工作， mode 在切换时（UITrackingRunLoopMode）就不工作了
 */
- (void)test {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
}

// tableview、scrollview 在滚动的时候 run 方法就不在执行了
- (void)run {
    NSLog(@"%s -- %@", __func__, CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent()));
}

@end
