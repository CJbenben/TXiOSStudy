//
//  CJTools.h
//  JKHome
//
//  Created by chenamei on 16/1/24.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CJTools : NSObject

@end

@interface CJViewLayer : NSObject

- (instancetype)initWithLayerView:(UIView *)originalView color:(UIColor *)color radius:(CGFloat)radius;

/**
 *  对视图layer图层进行处理
 *
 *  @param originalView 原视图
 *  @param color        边框颜色
 *  @param radius       边框圆角
 *
 *  @return layer后视图
 */
+ (instancetype)cjLayerView:(UIView *)originalView color:(UIColor *)color radius:(CGFloat)radius;
@end


@interface AuthcodeView : UIView
@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串

- (void)getAuthcode;

@end


@interface UIColor (UIColor_Hex)

+ (UIColor*)colorWithHexString:(NSString*)hexstring;
+ (UIColor*)colorWithHexString:(NSString *)hexstring alpha:(CGFloat)alpha;

@end


@interface CJTextSizeWithString : NSObject

+ (CGSize)cjSizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;

@end


@interface CJShowAlertMsg : UIView

+ (void)cjShowAlertMessage:(NSString *)message;

@end

@interface CJSettingViewProperty : NSObject

/**
 *  统一设置控件属性
 *
 *  @param originaView 原视图
 *  @param color       背景视图颜色
 *
 *  @return 设置之后的视图
 */
+ (instancetype)cjSettingProperty:(id)originaView backgroundColor:(UIColor *)color;


- (instancetype)initWithSettingLabelProperty:(id)originaView backgroundColor:(UIColor *)color textColor:(UIColor *)textColor textPosition:(NSTextAlignment)textPosition;

+ (instancetype)cjSettingLabelProperty:(id)originaView backgroundColor:(UIColor *)color textColor:(UIColor *)textColor textPosition:(NSTextAlignment)textPosition;
@end




