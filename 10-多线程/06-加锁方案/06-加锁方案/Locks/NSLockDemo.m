//
//  NSLockDemo.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/15.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
@property (nonatomic, strong) NSLock *moneyLock;
@property (nonatomic, strong) NSLock *ticketLock;
@end

@implementation NSLockDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.moneyLock = [[NSLock alloc] init];
        self.ticketLock = [[NSLock alloc] init];
        
    }
    return self;
}

- (void)__saveMoney {
    // 加锁
    [self.moneyLock lock];
    
    [super __saveMoney];
    
    // 解锁
    [self.moneyLock unlock];
}

- (void)__drawMoney {
    
    // 加锁
    [self.moneyLock lock];
    
    [super __drawMoney];
    
    // 解锁
    [self.moneyLock unlock];
    
}

- (void)__saleTicket {
    
    // 加锁
    [self.ticketLock lock];
    
    [super __saleTicket];
    
    // 解锁
    [self.ticketLock unlock];
    
}

@end
