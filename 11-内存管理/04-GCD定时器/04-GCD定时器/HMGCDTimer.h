//
//  HMGCDTimer.h
//  LYHM
//
//  Created by chenxiaojie on 2019/12/18.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 因 NSTimer 不准的问题，这里通过 gcd 封装了一个定时器 */
@interface HMGCDTimer : NSObject 

/**
 @brief 开启定时器
 @param start              几秒后开始执行
 @param interval       间隔执行任务秒数
 @param repates         是否重复
 @param async              是否异步执行，如果为 YES，记得回主线程更新UI
 @param taskBlock     定时任务回调
 @return NSString        具体定时器名称，用于取消时使用
*/
+ (NSString *)startGCDTimerWithStart:(NSTimeInterval)start interval:(NSTimeInterval)interval repates:(BOOL)repates async:(BOOL)async taskBlock:(void (^)(void))taskBlock;

/**
 @brief 暂停定时器
 @param name        定时器标识（开启时会返回）
*/

+ (void)pauseTimer:(NSString *)name;
/**
 @brief 重启定时器
 @param name        定时器标识（开启时会返回）
*/

+ (void)resumeTimer:(NSString *)name;
/**
 @brief 停止定时器
 @param name        定时器标识（开启时会返回）
*/

+ (void)stopTimer:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
