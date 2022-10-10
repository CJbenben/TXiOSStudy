//
//  NSObject+TXUnRecognizedSelHandler.m
//  RuntimeDemo
//
//  Created by chenxiaojie on 2022/3/7.
//

#import "NSObject+TXUnRecognizedSelHandler.h"
#import <objc/runtime.h>

@implementation NSObject (TXUnRecognizedSelHandler)
//
////触发崩溃
//- (void)doesNotRecognizeSelector:(SEL)aSelector {
//    NSLog(@"cash = %@, %s", [self class], aSelector);
//}

//+ (void)load{
//    Method method1 = class_getInstanceMethod([self class], @selector(forwardingTargetForSelector:));
//    Method method2 = class_getInstanceMethod([self class], @selector(tx_forwardingTargetForSelector:));
//    method_exchangeImplementations(method1, method2);
//}

- (id)tx_forwardingTargetForSelector:(SEL)aSelector {
    if (class_respondsToSelector([self class], @selector(forwardInvocation:))) {
        IMP impOfNSObject = class_getMethodImplementation([NSObject class], @selector(forwardInvocation:));
        IMP imp = class_getMethodImplementation([self class], @selector(forwardInvocation:));
        if (impOfNSObject != imp) {
            return nil;
        }
    }
    NSObject *object = [[NSObject alloc] init];
    // 动态给 NSObject 添加方法
    BOOL addMethod = class_addMethod([NSObject class], aSelector, class_getMethodImplementation([NSObject class], @selector(dynamicMethod)), "v@:");
    if (addMethod) {
        //NSLog(@"动态方法添加成功！");
    }
    return object;
}

- (void)dynamicMethod {
    NSLog(@"self = %@, %s", [self class], __func__);
}


//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    NSLog(@"111111111111");
//}
//
//- (id)valueForUndefinedKey:(NSString *)key {
//    return nil;
//}

@end
