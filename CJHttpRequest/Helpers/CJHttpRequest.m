//
//  CJHttpRequest.m
//  BBAfnetWorkingSecond封装
//
//  Created by ChenJie on 16/4/20.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "CJHttpRequest.h"

@implementation CJHttpRequest

#pragma mark -
#pragma mark - GET请求
- (void)GETwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager=[[AFHTTPRequestOperationManager alloc]init];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)GETwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    [request GETwithUrl:url parameters:parameters success:success failure:failure];
}


#pragma mark -
#pragma mark - POST请求
- (instancetype)POSTwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager=[[AFHTTPRequestOperationManager alloc]init];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    __block AFHTTPRequestOperation *cjOperation;
    
    AFHTTPRequestOperation *operation = [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            cjOperation = operation;
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            cjOperation = operation;
            failure(error);
        }
    }];
    
    return (id)operation;
}

+ (instancetype)POSTwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    return [request POSTwithUrl:url parameters:parameters success:success failure:failure];
}


#pragma mark -
#pragma mark - POST/GET网络请求
- (void)requestDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameters type:(HttpRequestType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", nil];
    
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    switch (type) {
        case HttpRequestTypeGet:{
            
            [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if (success) {
                    success(responseObject);
                }
                NSLog(@"success:result:%@",responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (failure) {
                    failure(error);
                }
                NSLog(@"error:%@",error);
            }];
        }
            break;
            
        case HttpRequestTypePost:{
            
            [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if (success) {
                    success(responseObject);
                }
                NSLog(@"success:result:%@",responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (failure) {
                    failure(error);
                }
                NSLog(@"error:%@",error);
            }];
        }
            break;
    }
}

+ (void)requestDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameters type:(HttpRequestType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    [request requestDataWithUrl:url parameters:parameters type:type success:success failure:failure];
}


- (void)getData:(CJHttpRequest *)request success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", nil];
    
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    switch (request.type) {
        case HttpRequestTypeGet:{
            
            [manager GET:request.urlString parameters:request.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if (success) {
                    success(responseObject);
                }
                NSLog(@"success:result:%@",responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (failure) {
                    failure(error);
                }
                NSLog(@"error:%@",error);
            }];
        }
            break;
            
        case HttpRequestTypePost:{
            
            [manager POST:request.urlString parameters:request.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if (success) {
                    success(responseObject);
                }
                NSLog(@"success:result:%@",responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (failure) {
                    failure(error);
                }
                NSLog(@"error:%@",error);
            }];
        }
            break;
    }
}
@end
