//
//  TXPerson.h
//  12-block内存管理
//
//  Created by chenxiaojie on 2021/8/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TXBlock) (void);

@interface TXPerson : NSObject

@property (nonatomic, copy) TXBlock block;
@property (nonatomic, assign) int age;

@end

NS_ASSUME_NONNULL_END
