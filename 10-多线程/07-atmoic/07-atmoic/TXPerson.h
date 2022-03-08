//
//  TXPerson.h
//  07-atmoic
//
//  Created by chenxiaojie on 2021/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject

@property (nonatomic, assign) int age;
@property (atomic, strong) NSString *name;

@property (nonatomic, strong) NSMutableArray *data;

@end

NS_ASSUME_NONNULL_END
