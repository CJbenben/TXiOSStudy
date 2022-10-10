//
//  TXAddress.h
//  100-TestDemo
//
//  Created by chenxiaojie on 2022/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXAddress : NSObject

@property (nonatomic, copy)NSString* country;
@property (nonatomic, copy)NSString* province;
@property (nonatomic, strong)NSString* city;
@property (nonatomic, assign)int district;

@end

NS_ASSUME_NONNULL_END
