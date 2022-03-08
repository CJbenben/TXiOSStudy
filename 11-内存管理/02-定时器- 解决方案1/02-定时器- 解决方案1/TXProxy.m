//
//  TXProxy.m
//  02-定时器- 解决方案1
//
//  Created by chenxiaojie on 2021/10/14.
//

#import "TXProxy.h"

@implementation TXProxy

+ (instancetype)proxyWithTarget:(id)target {
    TXProxy *proxy = [[TXProxy alloc] init];
    proxy.target = target;
    return proxy;
}

// 因为 TXProxy 并没有 timerTest 方法，会进入 runtime 的消息转发。让 self.target(VC) 去处理
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

@end
