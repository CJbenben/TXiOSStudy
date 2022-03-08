//
//  TXPerson.m
//  02-KVC原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import "TXPerson.h"

@implementation TXPerson

- (int)getAge {
    return 11;
}

- (int)age {
    return 12;
}

- (int)isAge {
    return 13;
}

- (int)_age {
    return 14;
}

// 系统方法，没有查找到 getAge、age、isAge 和 _age: 方法后，会调用此方法询问：是否可以访问成员变量
+ (BOOL)accessInstanceVariablesDirectly {
    // NO：不允许访问，这个时候 valueForKey:的话，会报错：NSUnknownKeyException
    // YES：也是默认值，可以访问成员变量并取值 _key _isKey key isKey (有序访问)，如果都没有则会报错：NSUnknownKeyException
    return YES;
}

@end
