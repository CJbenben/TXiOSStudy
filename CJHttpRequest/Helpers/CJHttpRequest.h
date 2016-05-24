//
//  CJHttpRequest.h
//  CJHttpRequest
//
//  Created by ChenJie on 16/4/20.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJResponse.h"

typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /*  get请求  */
    HttpRequestTypeGet = 0,
    /*  post请求  */
    HttpRequestTypePost
};

@interface CJHttpRequest : NSObject

/**
 *  接口地址
 */
@property (strong, nonatomic) NSString *urlString;

/**
 *  请求参数
 */
@property (strong, nonatomic) NSDictionary *parameters;

/**
 *  请求类型(默认get请求)
 */
@property (assign, nonatomic) HttpRequestType type;

- (AFHTTPRequestOperation *)getData:(CJHttpRequest *)request success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


/**
 *  发送get请求
 *
 *  @param urlStr  请求的网址字符串
 *  @param param   请求的参数
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (AFHTTPRequestOperation *)GETwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


/**
 *  发送post请求
 *
 *  @param urlStr  请求的网址字符串
 *  @param param   请求的参数
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (AFHTTPRequestOperation *)POSTwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


/**
 *  发送网络请求
 *
 *  @param urlStr  请求的网址字符串
 *  @param param   请求的参数
 *  @param type    请求的类型
 *  @param success 请求的结果
 *  @param failure 请求失败
 */
+ (AFHTTPRequestOperation *)requestDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameters type:(HttpRequestType)type success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

@end
