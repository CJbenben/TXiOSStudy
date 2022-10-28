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
    if (aSelector == @selector(test:)) {
        /* 细节1：v16@0:8 可以简写为 v@: */
//        return [NSMethodSignature signatureWithObjCTypes:"v@:i"];
//        return [NSMethodSignature signatureWithObjCTypes:"v20@0:8i16"];
        
        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 细节2：可以修改传入参数值
    int age;
    [anInvocation getArgument:&age atIndex:2];
    NSLog(@"age is = %d", age * 2);
    
    
    
    // 细节3：可以拿到返回值
    [anInvocation invokeWithTarget:[[TXCat alloc] init]];
    int value;
    [anInvocation getReturnValue:&value];
    
    NSLog(@"value = %d", value);
}

@end
