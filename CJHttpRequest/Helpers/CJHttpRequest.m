//
//  CJHttpRequest.m
//  BBAfnetWorkingSecond封装
//
//  Created by ChenJie on 16/4/20.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "CJHttpRequest.h"

#define REQUERT_TIMEOUT         15

@implementation CJHttpRequest

#pragma mark -
#pragma mark - GET请求
+ (AFHTTPRequestOperation *)GETwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    return [request GETwithUrl:url parameters:parameters success:success failure:failure];
}

- (AFHTTPRequestOperation *)GETwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", nil];
    //设置请求超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REQUERT_TIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    
    if (![self checkWebWeatherInter:manager]) {
        return nil;
    };
    
    __block AFHTTPRequestOperation *cjOperation;
    
    AFHTTPRequestOperation *operation = [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success_result:%@",responseObject);
        cjOperation = operation;
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure:%@   error.code:%ld",error.domain,(long)error.code);
        cjOperation = operation;
        
        CJResponse *response = [[CJResponse alloc] init];
        response.error = operation.error;
        response.code = [operation.error code];
        
        [self showAlertMsgWithWebResult:response];
        
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}


#pragma mark -
#pragma mark - POST请求
+ (AFHTTPRequestOperation *)POSTwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    return [request POSTwithUrl:url parameters:parameters success:success failure:failure];
}

- (AFHTTPRequestOperation *)POSTwithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json", nil];
    //设置请求超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REQUERT_TIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    
    if (![self checkWebWeatherInter:manager]) {
        return nil;
    };
    
    __block AFHTTPRequestOperation *cjOperation;
    
    AFHTTPRequestOperation *operation = [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success_result:%@",responseObject);
        cjOperation = operation;
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure:%@   error.code:%ld",error.domain,(long)error.code);
        cjOperation = operation;
        
        CJResponse *response = [[CJResponse alloc] init];
        response.error = operation.error;
        response.code = [operation.error code];
        
        [self showAlertMsgWithWebResult:response];
        
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

- (BOOL)checkWebWeatherInter:(AFHTTPRequestOperationManager*)manager {
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    [manager.reachabilityManager startMonitoring];
    return true;
}

- (BOOL)showAlertMsgWithWebResult:(CJResponse *)response {
    
    if (response.error == nil) {
        return TRUE;
    }
    
    if (response.code == NSURLErrorNotConnectedToInternet) {
        [CJShowAlertMsg cjShowAlertMessage:@"检查网络设置"];
        return FALSE;
    }else if (response.code == NSURLErrorTimedOut){
        [CJShowAlertMsg cjShowAlertMessage:@"请求超时"];
        return FALSE;
    }else if (response.code == NSURLErrorCancelled){
        NSLog(@"用户取消了请求");
        return FALSE;
    }
    
//    [self alertErrorMessage:@"服务器故障，请稍后再试。"];
    
    return true;
}

#pragma mark -
#pragma mark - POST/GET网络请求
+ (AFHTTPRequestOperation *)requestDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameters type:(HttpRequestType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    return [request requestDataWithUrl:url parameters:parameters type:type success:success failure:failure];
}

- (AFHTTPRequestOperation *)requestDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameters type:(HttpRequestType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    CJHttpRequest *request = [[CJHttpRequest alloc] init];
    switch (type) {
        case HttpRequestTypeGet:{
            return [request GETwithUrl:url parameters:parameters success:success failure:failure];
        }
            break;
        case HttpRequestTypePost:{
            return [request POSTwithUrl:url parameters:parameters success:success failure:failure];
        }
            break;
        default:

            break;
    }
}


- (AFHTTPRequestOperation *)getData:(CJHttpRequest *)request success:(void (^)(id result))success failure:(void (^)(NSError *error))failure{
    return [request requestDataWithUrl:request.urlString parameters:request.parameters type:request.type success:success failure:failure];
}
@end
