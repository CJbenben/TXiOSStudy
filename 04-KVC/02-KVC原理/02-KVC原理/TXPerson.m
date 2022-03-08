//
//  TXPerson.m
//  02-KVC原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import "TXPerson.h"

@implementation TXPerson

- (void)setAge:(int)age {
    _age = age;
    NSLog(@"setAge - %d", age);
}

// 因为 .h 中定义的 age 为属性，会自动生成 setter 方法，故_setAge:方法不会执行。
// 执行_setAge:方法请看03-KVC原理2 的项目
- (void)_setAge:(int)age {
    _age = age;
    NSLog(@"_setAge - %d", age);
}

@end
