//
//  TXPerson+Test.h
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import "TXPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson (Test)
//{
//    int _weight;// Instance variables may not be placed in categories
//}
@property (nonatomic, assign) int weight;
@property (nonatomic, strong) NSString *name;

/**
    注意：在分类中定义的属性，并不会帮我们生成成员变量，只会定义 setter 和 get 方法，需要我们自己实现
 */
@end

NS_ASSUME_NONNULL_END
