//
//  TXPerson+Test.m
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import "TXPerson+Test.h"

@implementation TXPerson (Test)

#define TXKey [NSString stringWithFormat:@"%p", self]
// 使用字典来存储不同对象的 weight 值
NSMutableDictionary *weights_;

NSMutableDictionary *names_;

+ (void)load {
    weights_ = [NSMutableDictionary dictionary];
    names_ = [NSMutableDictionary dictionary];
}

- (void)setWeight:(int)weight {
//    NSString *key = [NSString stringWithFormat:@"%p", self];
    weights_[TXKey] = @(weight);
}

- (int)weight {
//    NSString *key = [NSString stringWithFormat:@"%p", self];
    return [weights_[TXKey] intValue];
}

- (void)setName:(NSString *)name {
    names_[TXKey] = name;
}

- (NSString *)name {
    return names_[TXKey];
}

@end
