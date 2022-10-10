//
//  ViewController.m
//  04-多线程带来的安全隐患
//
//  Created by chenxiaojie on 2021/9/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) int ticketsCount;
@property (nonatomic, assign) int money;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self ticketTest];
    
//    [self moneyTest];
}


/**
 存钱、取钱演示
 */
- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            [self drawMoney];
        }
    });
}

/**
 存钱
 */
- (void)saveMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存了50元，还剩%d元 --- %@", oldMoney, [NSThread currentThread]);
}

/**
 取钱
 */
- (void)drawMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取了20元，还剩%d元 --- %@", oldMoney, [NSThread currentThread]);
}


/**
 卖票演示
 */
- (void)ticketTest {
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [self saleTicket];
        }
    });
}

/**
 卖票
 */
- (void)saleTicket {
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    
    NSLog(@"还剩%d票  %@", oldTicketsCount, [NSThread currentThread]);
}

@end
