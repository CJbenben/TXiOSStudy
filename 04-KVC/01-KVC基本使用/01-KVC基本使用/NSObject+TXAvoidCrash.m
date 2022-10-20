//
//  NSObject+TXAvoidCrash.m
//  01-KVC基本使用
//
//  Created by chenxiaojie on 2022/3/8.
//

#import "NSObject+TXAvoidCrash.h"

@implementation NSObject (TXAvoidCrash)

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"111111111111");
}
//
//- (id)valueForUndefinedKey:(NSString *)key {
//    return nil;
//}
@end
