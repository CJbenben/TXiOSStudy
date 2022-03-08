//
//  ViewController.m
//  01-定时器
//
//  Created by chenxiaojie on 2021/10/13.
//

#import "ViewController.h"
#import "TXProxy.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *link;

@end
  
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Question
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    // Answer1
//    __weak typeof(self) weakSelf = self ;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerTest];
//    }];
    // Answer2
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[TXProxy proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    // Question
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    // Answer
//    self.link = [CADisplayLink displayLinkWithTarget:[TXProxy proxyWithTarget:self] selector:@selector(timerTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}

- (void)timerTest {
    NSLog(@"%s", __func__);
}

/*
 在返回上一个页面时：dealloc 方法并没有执行，因为  self 与 定时器之间，产生了循环引用
 */
- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.timer invalidate];
    [self.link invalidate];
}


@end
