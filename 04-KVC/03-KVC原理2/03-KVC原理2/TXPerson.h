//
//  TXPerson.h
//  02-KVC原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject
{
    @public
    // _key _isKey key isKey
    int _age;
    int _isAge;
    int age;
    int isAge;
}

@end

NS_ASSUME_NONNULL_END
