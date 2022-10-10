//
//  ViewController.m
//  04-多线程带来的安全隐患
//
//  Created by chenxiaojie on 2021/9/14.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "MutexDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"

@interface ViewController ()

@property (nonatomic, strong) TXBaseDemo *baseDemo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.baseDemo = [[NSConditionLockDemo alloc] init];
//    [self.baseDemo moneyTest];
//    [self.baseDemo ticketTest];
    [self.baseDemo otherTest];
}


@end
