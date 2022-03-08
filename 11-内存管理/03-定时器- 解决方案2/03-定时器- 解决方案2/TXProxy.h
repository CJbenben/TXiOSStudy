//
//  TXProxy.h
//  02-定时器- 解决方案1
//
//  Created by chenxiaojie on 2021/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
