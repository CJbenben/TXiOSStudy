//
//  TXPerson.m
//  02-KVC原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import "TXPerson.h"

@implementation TXPerson

//- (void)setAge:(int)age {
//    _age = age;
//    NSLog(@"setAge - %d", age);
//}
//
//- (void)_setAge:(int)age {
//    _age = age;
//    NSLog(@"_setAge - %d", age);
//}

// 系统方法，没有查找到 setAge: 和 _setAge: 方法后，会调用此方法询问：是否可以访问成员变量
+ (BOOL)accessInstanceVariablesDirectly {
    // NO：不允许访问，这个时候 setValue:forKey:的话，会报错：NSUnknownKeyException
    // YES：也是默认值，可以访问成员变量并设置值 _key _isKey key isKey (有序访问)，如果都没有则会报错：NSUnknownKeyException
    NSLog(@"accessInstanceVariablesDirectly");
    return YES;
}

//- (void)willChangeValueForKey:(NSString *)key {
//    [super willChangeValueForKey:key];
//    NSLog(@"willChangeValueForKey");
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"didChangeValueForKey-begin");
//    [super didChangeValueForKey:key];
//    NSLog(@"didChangeValueForKey-end");
//}

@end
