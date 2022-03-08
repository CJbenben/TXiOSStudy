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
    
    
    //NSLog(@"%@", [NSRunLoop mainRunLoop]);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 回到子线程刷新 UI
        // gcd这种情况下，也是交给 runloop 处理，依赖于 runloop
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"22222222");
        });
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSLog(@"1234567890-");
    
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"123456");
    }];
}

@end
