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

//- (void)test {
//    NSLog(@"%s", __func__);
//}

// 如果没有以下代码（动态方法解析）将进入第三阶段，消息转发
//void other() {
//    NSLog(@"other");
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(test)) {
//
//        class_addMethod(self, sel, (IMP)other, "v16@0:8");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

// 消息转发第一部分
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(test)) {
//        // 转发给能实现这个方法的对象
//        return [[TXCat alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

// 如果第一部分没有实现，则执行消息转发第二部分
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    anInvocation.target = [[TXCat alloc] init];
//    [anInvocation invoke];
    
    [anInvocation invokeWithTarget:[[TXCat alloc] init]];
}

@end
