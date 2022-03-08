//
//  ViewController.m
//  01-认识RunLoop
//
//  Created by chenxiaojie on 2021/9/2.
//

#import "ViewController.h"
#import "TXPermenantThread.h"

// 封装一个一直存在保活的子线程
@interface ViewController ()
@property (nonatomic, strong) TXPermenantThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.thread = [[TXPermenantThread alloc] init];
//    [self.thread run];
}

- (IBAction)stop {
    [self.thread stop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
        NSLog(@"执行了一个任务 --- %@", [NSThread currentThread]);
    }];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
