//
//  TXAddress.m
//  100-TestDemo
//
//  Created by chenxiaojie on 2022/3/11.
//

#import "TXAddress.h"

@implementation TXAddress

- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"不能为 nil");
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"请检查传入的 key 值 = %@", key);
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
