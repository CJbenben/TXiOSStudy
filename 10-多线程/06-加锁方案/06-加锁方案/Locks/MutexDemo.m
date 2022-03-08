//
//  MutexDemo.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/15.
//

#import "MutexDemo.h"
#import <pthread/pthread.h>

@interface MutexDemo ()
@property (nonatomic, assign) pthread_mutex_t moneyMutex;
@property (nonatomic, assign) pthread_mutex_t ticketMutex;
@end

@implementation MutexDemo

- (void)__initMutex:(pthread_mutex_t *)mutex {
    // 方法一：静态初始化
//        pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
//    // 方法二：动态初始化
//    // 初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
//    // 初始化锁
//    pthread_mutex_init(mutex, &attr);
//
//    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
    
    // 方法三：动态初始化
    // 初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
    // 初始化锁
    pthread_mutex_init(mutex, NULL);
    
    // 销毁属性
//    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init {
    if (self = [super init]) {
        
        [self __initMutex:&_moneyMutex];
        [self __initMutex:&_ticketMutex];
        
    }
    return self;
}

- (void)__saveMoney {
    // 加锁
    pthread_mutex_lock(&_moneyMutex);
    
    [super __saveMoney];
    
    // 解锁
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__drawMoney {
    
    // 加锁
    pthread_mutex_lock(&_moneyMutex);
    
    [super __drawMoney];
    
    // 解锁
    pthread_mutex_unlock(&_moneyMutex);
    
}

- (void)__saleTicket {
    
    // 加锁
    pthread_mutex_lock(&_ticketMutex);
    
    [super __saleTicket];
    
    // 解锁
    pthread_mutex_unlock(&_ticketMutex);
    
}

- (void)dealloc {
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutex);
}

@end
