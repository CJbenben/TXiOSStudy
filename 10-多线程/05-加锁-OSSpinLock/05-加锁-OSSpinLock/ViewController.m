//
//  ViewController.m
//  04-多线程带来的安全隐患
//
//  Created by chenxiaojie on 2021/9/14.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h> 

@interface ViewController ()
@property (nonatomic, assign) int ticketsCount;
@property (nonatomic, assign) int money;

@property (nonatomic, assign) OSSpinLock lock;
@property (nonatomic, assign) OSSpinLock lock1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    // 创建锁
    _lock = OS_SPINLOCK_INIT;
    _lock1 = OS_SPINLOCK_INIT;
    
    [self ticketTest];
    
    [self moneyTest];
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
    // 加锁
    OSSpinLockLock(&_lock1);
    
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存了50元，还剩%d元 --- %@", oldMoney, [NSThread currentThread]);
    
    // 解锁
    OSSpinLockUnlock(&_lock1);
}

/**
 取钱
 */
- (void)drawMoney {
    // 加锁
    OSSpinLockLock(&_lock1);
    
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取了20元，还剩%d元 --- %@", oldMoney, [NSThread currentThread]);
    
    // 解锁
    OSSpinLockUnlock(&_lock1);
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
    
    // 加锁
    OSSpinLockLock(&_lock);
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    
    NSLog(@"还剩%d票  %@", oldTicketsCount, [NSThread currentThread]);
    
    // 解锁
    OSSpinLockUnlock(&_lock);
}

@end
