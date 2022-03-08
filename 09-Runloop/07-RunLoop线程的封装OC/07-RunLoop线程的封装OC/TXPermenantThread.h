//
//  TXPermenantThread.h
//  07-RunLoop线程的封装OC
//
//  Created by chenxiaojie on 2021/9/8.
//

#import <Foundation/Foundation.h>

typedef void (^TXPermenantThreadTask)(void);

NS_ASSUME_NONNULL_BEGIN

/** 子线程保活封装，只要创建此对象，就自动开启了一个线程 */
@interface TXPermenantThread : NSObject

///**
// @brief 开启一个线程
// */
//- (void)run;
/**
 @brief 执行一个任务
 @param task 任务
 */
- (void)executeTask:(TXPermenantThreadTask)task;
/**
 @brief 也可以手动停止一个线程，内部会自动停止
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
