//
//  ViewController.m
//  04-GCD定时器
//
//  Created by chenxiaojie on 2021/11/10.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

//// ARC 环境也会自动帮我们转成 MRC 环境
//- (void)setName:(NSString *)name {
//    _name = name;
//}

//// MRC 环境下
//- (void)setName:(NSString *)name {
//    if (_name != name) {
//        [_name release];
//        _name = [name retain];
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 运行崩溃 多线程代码执行到 [_name release] 时，导致跨内存访问而崩溃。解决方案：在 setName 方法之前加锁，之后解锁
//    for (NSInteger i = 0; i < 1000; i++) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            // 加锁
//            self.name = [NSString stringWithFormat:@"abcdefghijk"];
//            // 解锁
//        });
//    }
    
    // 但是以下代码就会不崩溃
    for (NSInteger i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.name = [NSString stringWithFormat:@"abc"];
        });
    }
    NSLog(@"end");
    
    
    // 因为 abc 是 TaggedPointer，根本不会执行到 setName 方法。以下代码时验证：
    NSString *str1 = [NSString stringWithFormat:@"abc"];
    NSString *str2 = [NSString stringWithFormat:@"abcdefghijk"];
    
    NSLog(@"%@ %@", [str1 class], [str2 class]);
    NSLog(@"%p %p", str1, str2);
    
}


@end
