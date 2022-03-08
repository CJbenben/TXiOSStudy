//
//  OSSpinLockDemo.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/14.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo ()
@property (nonatomic, assign) OSSpinLock moneyLock;
@end

@implementation OSSpinLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__saveMoney {
    // 加锁
    OSSpinLockLock(&_moneyLock);
    
    [super __saveMoney];
    
    // 解锁
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__drawMoney {
    
    // 加锁
    OSSpinLockLock(&_moneyLock);
    
    [super __drawMoney];
    
    // 解锁
    OSSpinLockUnlock(&_moneyLock);
    
}

- (void)__saleTicket {
    
    static OSSpinLock ticketLock = OS_SPINLOCK_INIT;
    // 加锁
    OSSpinLockLock(&ticketLock);
    
    [super __saleTicket];
    
    // 解锁
    OSSpinLockUnlock(&ticketLock);
    
}

@end
