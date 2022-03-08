//
//  ViewController.m
//  04-GCD定时器
//
//  Created by chenxiaojie on 2021/11/10.
//

#import "ViewController.h"
#import "HMGCDTimer.h"
#import "HMTimer.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *task;
@property (nonatomic, strong) HMGCDTimer *gcdTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"begin");
    
    self.gcdTimer = [[HMGCDTimer alloc] init];
                                                                                                                                                                                            
    self.task = [HMGCDTimer startGCDTimerWithStart:2.0 interval:1.0 repates:YES async:NO taskBlock:^{
        NSLog(@"11111111 - %@", [NSThread currentThread]);
    }];
}

static int count = 0;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [[HMGCDTimer sharedGCDTimerManager] stopTimer:self.task];
    count ++;
    if (count % 2 == 0) {
        [HMGCDTimer resumeTimer:self.task];
    } else {
        [HMGCDTimer pauseTimer:self.task];
    }
}

- (void)dealloc {
    [HMGCDTimer stopTimer:self.task];
    NSLog(@"%s", __func__);
}


@end
