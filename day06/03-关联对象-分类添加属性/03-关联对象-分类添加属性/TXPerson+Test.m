//
//  TXPerson+Test.m
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import "TXPerson+Test.h"
#import <objc/runtime.h>

@implementation TXPerson (Test)

// 这里必须使用 static 防止其他地方修改
static const void *TXWeightKey = &TXWeightKey;
static const void *TXNameKey = &TXNameKey;

- (void)setWeight:(int)weight {
    // 设置关联对象
    objc_setAssociatedObject(self, TXWeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)weight {
    return [objc_getAssociatedObject(self, TXWeightKey) intValue];
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, TXNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, TXNameKey);
}

@end
