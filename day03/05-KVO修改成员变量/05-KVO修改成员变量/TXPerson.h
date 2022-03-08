//
//  TXPerson.h
//  01-KVO基本使用
//
//  Created by chenxiaojie on 2021/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject
{
    @public
    int _age;
}
@property (nonatomic, assign) int age;

@end

NS_ASSUME_NONNULL_END
