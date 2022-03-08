//
//  TXPerson+Test.m
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import "TXPerson+Test.h"
#import <objc/runtime.h>

@implementation TXPerson (Test)

// 第三种方案：
- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, @selector(weight), @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)weight {
    //return [objc_getAssociatedObject(self, @selector(weight)) intValue];
    // @selector(weight) == _cmd
    return [objc_getAssociatedObject(self, _cmd) intValue];
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    //return objc_getAssociatedObject(self, @selector(name));
    // @selector(name) == _cmd
    return objc_getAssociatedObject(self, _cmd);
    
    
    objc_removeAssociatedObjects(<#id  _Nonnull object#>)
}



// 第二种方案：
//- (void)setWeight:(int)weight {
//    NSString *key = @"weight";
//    NSLog(@"两个地址值相同  %p %p", key, @"weight");
//
//                                // 这里传入的是字符串指针
//    objc_setAssociatedObject(self, @"weight", @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (int)weight {
//    return [objc_getAssociatedObject(self, @"weight") intValue];
//}
//
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, @"name");
//}



// 第一种方案：
//static const char TXNameKey;
//static const char TXWeightKey;
//
//- (void)setWeight:(int)weight {
//    // 设置关联对象
//    objc_setAssociatedObject(self, &TXWeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (int)weight {
//    return [objc_getAssociatedObject(self, &TXWeightKey) intValue];
//}
//
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, &TXNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, &TXNameKey);
//}

@end
