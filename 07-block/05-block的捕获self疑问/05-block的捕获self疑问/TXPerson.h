//
//  TXPerson.h
//  05-block的捕获self疑问
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject

@property (nonatomic, strong) NSString *name;

- (void)test;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
