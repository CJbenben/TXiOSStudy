//
//  TXPerson.m
//  09-runtime-动态方法解析
//
//  Created by chenxiaojie on 2022/10/27.
//

#import "TXPerson.h"
#import <objc/runtime.h>

@implementation TXPerson

//- (void)test {
//    NSLog(@"%s", __func__);
//}

// 1.动态添加 OC 方法
- (void)other {
    NSLog(@"%s", __func__);
}
+ (void)other {
    NSLog(@"%s", __func__);
}

// 2.动态添加 C 语言方法
void c_other(id self, SEL _cmd) {
    NSLog(@"c_other - %@, --%@", self, NSStringFromSelector(_cmd));
}

/*
 * 如果第一阶段（消息发送）没有找到 test 方法，将进入动态方法解析阶段
 */
// 对象方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s", __func__);
    if (sel == @selector(test)) {
        // 动态方法解析阶段：可以动态给类添加对象方法、类方法
        Method method = class_getInstanceMethod(self, @selector(other));
        class_addMethod(self/* 类对象 */, sel, method_getImplementation(method), method_getTypeEncoding(method));

        return YES;
    }
//    if (sel == @selector(test)) {
//        class_addMethod(self, sel, (IMP)c_other, "v16@0:8");
//
//        return YES;
//    }
    
    return [super resolveInstanceMethod:sel];
}


// 类方法
+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(test)) {
        Method method = class_getClassMethod(self, @selector(other));
        
        class_addMethod(object_getClass(self)/*元类对象*/, sel, method_getImplementation(method), method_getTypeEncoding(method));
        
        return YES;
    }
    return [super resolveClassMethod:sel];
}

@end
