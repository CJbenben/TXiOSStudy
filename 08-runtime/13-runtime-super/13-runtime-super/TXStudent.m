//
//  TXStudent.m
//  13-runtime-super
//
//  Created by chenxiaojie on 2022/10/28.
//

#import "TXStudent.h"
#import <objc/runtime.h>

@implementation TXStudent

/*
     [super message]的底层实现：
     1.消息接收者仍然是子类对象 self
     2.只是从父类开始查找方法的实现
 */
- (void)test {
    [super test];
    
    //((void (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("TXStudent"))}, sel_registerName("test"));
    /*
    objc_msgSendSuper)({
            self,// 消息接收者 仍然还是 TXStudent
            class_getSuperclass(objc_getClass("TXStudent") // TXPerson
    }, sel_registerName("test"));
     */
    
    NSLog(@"test123456");
}

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"[self class] = %@", [self class]); // TXStudent
        NSLog(@"[self superclass] = %@", [self superclass]); // TXPerson
        
        NSLog(@"--------------------");
        
        NSLog(@"[super class] = %@", [super class]);
        NSLog(@"[super superclass] = %@", [super superclass]);
    }
    return self;
}
@end


//// 伪代码
//@implementation NSObject
//
//- (Class)class {
//    // 返回什么类型取决于方法调用者（receiver）
//    // 即使 [super class]，那么方法调用者仍然是子类，所以返回的还是 TXStudent
//    return object_getClass(self);
//}
//
//- (Class)superclass {
//    return class_getSuperclass(object_getClass(self));
//}
//@end
