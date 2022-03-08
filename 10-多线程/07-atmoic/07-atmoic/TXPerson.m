//
//  TXPerson.m
//  07-atmoic
//
//  Created by chenxiaojie on 2021/10/12.
//

#import "TXPerson.h"

@implementation TXPerson

//- (void)setName:(NSString *)name {
    // 加锁
//    _name = name;
    // 解锁
//}

//- (NSString *)name {
    // 加锁
//    return _name;
    // 解锁
//}

// atmoic 修饰的属性，在 setter、get 方法内部是线程同步的，源码可参考 objc-accessors.mm 这个类的实现

@end
