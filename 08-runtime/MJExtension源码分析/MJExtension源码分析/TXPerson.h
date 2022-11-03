//
//  TXPerson.h
//  MJExtension源码分析
//
//  Created by chenxiaojie on 2022/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *detail;

@end

NS_ASSUME_NONNULL_END
