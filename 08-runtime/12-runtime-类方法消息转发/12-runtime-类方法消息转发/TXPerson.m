//
//  TXPerson.m
//  10-runtime-消息转发
//
//  Created by chenxiaojie on 2022/10/27.
//

#import "TXPerson.h"
#import <objc/runtime.h>
#import "TXCat.h"

@implementation TXPerson


// 消息转发第一部分
//+ (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(test)) {
//        // 转发给能实现这个方法的对象
////        return [[TXCat alloc] init];// 这样写就会调用 cat 的 - 方法
//        return [TXCat class];// 这样写就会调用 cat 的 + 方法
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

// 如果第一部分没有实现，则执行消息转发第二部分
+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"111111");
}

@end
