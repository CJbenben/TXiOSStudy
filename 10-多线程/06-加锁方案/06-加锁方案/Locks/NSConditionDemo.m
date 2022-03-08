//
//  NSConditionDemo.m
//  06-加锁方案
//
//  Created by chenxiaojie on 2021/9/15.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo ()
@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) NSMutableArray *data;
@end
@implementation NSConditionDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.condition = [[NSCondition alloc] init];
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
    [self.condition lock];
    
    [self.data addObject:@"123"];
    NSLog(@"添加了元素 -- %s", __func__);
    
    [self.condition unlock];
    
    // 发信号，根据条件 重新唤起的时候也会加锁
    [self.condition signal];
    
    // 这个是唤起所有线程，上面只是唤醒一个线程
//    [self.condition broadcast];
}

// 线程2 执行下面代码
- (void)__remove {
    [self.condition lock];
    
    NSLog(@"test");
    if (self.data.count == 0) {
        // 线程等待(睡觉时，会放出这把锁，__add 方法就可以进去了)
        [self.condition wait];
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素 -- %s", __func__);
    
    [self.condition unlock];
}

@end
