//
//  TXPerson.h
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject

@property (nonatomic, assign) int age;
/* 以上属性会帮我们自动生成成员变量、setter、get 方法 */

//{
//    int _age;
//}
//- (void)setAge:(int)age;
//- (int)age;
@end

NS_ASSUME_NONNULL_END
