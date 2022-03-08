//
//  NSConditionLockDemo.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/15.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()
@property (nonatomic, strong) NSConditionLock *conditionLock;
@end

@implementation NSConditionLockDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest {
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
    
}

// 线程1 执行下面代码
- (void)__one {
    //[self.conditionLock lock];
    [self.conditionLock lockWhenCondition:1];
    
    NSLog(@"%s", __func__);
    
    [self.conditionLock unlockWithCondition:2];
}

// 线程2 执行下面代码
- (void)__two {
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"%s", __func__);
    
    [self.conditionLock unlockWithCondition:3];
}

// 线程3 执行下面代码
- (void)__three {
    [self.conditionLock lockWhenCondition:3];
    
    NSLog(@"%s", __func__);
    
    [self.conditionLock unlock];
}

@end
