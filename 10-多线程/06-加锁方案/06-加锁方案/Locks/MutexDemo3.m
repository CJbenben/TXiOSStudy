//
//  MutexDemo3.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/15.
//

#import "MutexDemo3.h"
#import <pthread/pthread.h>

@interface MutexDemo3 ()
@property (nonatomic, assign) pthread_mutex_t mutex;
@property (nonatomic, strong) NSMutableArray *data;
// 条件
@property (nonatomic, assign) pthread_cond_t cond;
@end

@implementation MutexDemo3

- (void)__initMutex:(pthread_mutex_t *)mutex {
    
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);// 递归锁：允许同一个线程对一把锁进行重复加锁
    // 初始化锁
    pthread_mutex_init(mutex, &attr);

    // 初始化条件
    pthread_cond_init(&_cond, NULL);
    
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init {
    if (self = [super init]) {
        
        [self __initMutex:&_mutex];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest {
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    
}

// 线程1 执行下面代码
- (void)__add {
    pthread_mutex_lock(&_mutex);
    
    [self.data addObject:@"123"];
    NSLog(@"添加了元素 -- %s", __func__);
    
    pthread_mutex_unlock(&_mutex);
    
    // 发信号，根据条件 重新唤起的时候也会加锁
    pthread_cond_signal(&_cond);
    
    // 这个是唤起所有线程，上面只是唤醒一个线程
//    pthread_cond_broadcast(&_cond);
    
}

// 线程2 执行下面代码
- (void)__remove {
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"test");
    if (self.data.count == 0) {
        // 线程等待(睡觉时，会放出这把锁，__add 方法就可以进去了)
        pthread_cond_wait(&_cond, &_mutex);
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素 -- %s", __func__);
    
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
}


@end
