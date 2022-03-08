//
//  TXProxy.m
//  02-定时器- 解决方案1
//
//  Created by chenxiaojie on 2021/10/14.
//

#import "TXProxy.h"

@implementation TXProxy

+ (instancetype)proxyWithTarget:(id)target {
    TXProxy *proxy = [TXProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
