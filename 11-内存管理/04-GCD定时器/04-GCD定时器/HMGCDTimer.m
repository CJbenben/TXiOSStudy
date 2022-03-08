//
//  HMGCDTimer.m
//  LYHM
//
//  Created by chenxiaojie on 2019/12/18.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "HMGCDTimer.h"

@implementation HMGCDTimer

////全局变量
static NSMutableDictionary *timers_;
dispatch_semaphore_t semaphore_;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [NSMutableDictionary dictionary];
        semaphore_ = dispatch_semaphore_create(1);
    });
}

/**
 @brief 开启定时器
 @param start              几秒后开始执行
 @param interval       间隔执行任务秒数
 @param repates         是否重复
 @param async              是否异步执行
 @param taskBlock     定时任务回调
*/
+ (NSString *)startGCDTimerWithStart:(NSTimeInterval)start interval:(NSTimeInterval)interval repates:(BOOL)repates async:(BOOL)async taskBlock:(void (^)(void))taskBlock {
    
    if (!taskBlock || start < 0 || (interval <= 0 && repates)) return nil;
    
    dispatch_queue_t queue = async ? dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) : dispatch_get_main_queue();
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
    
    // 加锁：防止 开启定时器和停止定时器同步执行
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    NSString *name = [NSString stringWithFormat:@"%zd", timers_.count];
    timers_[name] = timer;
    dispatch_semaphore_signal(semaphore_);
    
    // 在这里执行事件
    dispatch_source_set_event_handler(timer, ^{
        taskBlock();
        
        // 不重复执行的话
        if (!repates) {
            [self stopTimer:name];
        }
    });
    
    // 启动定时器
    dispatch_resume(timer);

    return name;
}
 
+ (void)pauseTimer:(NSString *)name {
    if (name.length == 0) return;
    
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_suspend(timer);
    }
}

+ (void)resumeTimer:(NSString *)name {
    if (name.length == 0) return;
    
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_resume(timer);
    }
}

+ (void)stopTimer:(NSString *)name {
    if (name.length == 0) return;
    
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_source_cancel(timer);
        [timers_ removeObjectForKey:name];
    }
    dispatch_semaphore_signal(semaphore_);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
