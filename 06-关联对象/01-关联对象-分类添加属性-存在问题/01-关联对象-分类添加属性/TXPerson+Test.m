//
//  TXPerson+Test.m
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import "TXPerson+Test.h"

@implementation TXPerson (Test)

// 这样定义确实可以访问到 weight 的值，但是 weight 值是全局的，person2 修改了 weight 值，person1.weight 也会变化
int weight_;

- (void)setWeight:(int)weight {
    weight_ = weight;
}

- (int)weight {
    return weight_;
}

@end
