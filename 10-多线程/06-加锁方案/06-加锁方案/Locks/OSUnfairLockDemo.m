//
//  OSUnfairLockDemo.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/15.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()
@property (nonatomic, assign) os_unfair_lock moneyLock;
@end

@implementation OSUnfairLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saveMoney {
    // 加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super __saveMoney];
    
    // 解锁
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__drawMoney {
    
    // 加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super __drawMoney];
    
    // 解锁
    os_unfair_lock_unlock(&_moneyLock);
    
}

- (void)__saleTicket {
    
    static os_unfair_lock ticketLock = OS_UNFAIR_LOCK_INIT;
    // 加锁
    os_unfair_lock_lock(&ticketLock);
    
    [super __saleTicket];
    
    // 解锁
    os_unfair_lock_unlock(&ticketLock);
    
}
@end
