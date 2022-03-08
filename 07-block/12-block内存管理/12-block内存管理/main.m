//
//  main.m
//  12-block内存管理
//
//  Created by chenxiaojie on 2021/8/3.
//
/*
 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m
 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -fobjc-arc -fobjc-runtime=ios-9.0 main.m
 */
#import <Foundation/Foundation.h>
#import "TXPerson.h"

typedef void(^TXBlock) (void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TXBlock block;
        
//        {
//            TXPerson *person = [[TXPerson alloc] init];
//            block = ^{
//                NSLog(@"person = %@", person);
//            };
//        }
        
        
//        {
//            __block TXPerson *person = [[TXPerson alloc] init];
//            block = ^{
//                NSLog(@"person = %@", person);
//            };
//        }
        
        
        {
            __block TXPerson *person = [[TXPerson alloc] init];
            __weak TXPerson *weakPerson = person;
            block = ^{
                NSLog(@"person = %@", weakPerson);
            };
        }
        
        block();
        
        
    }
    return 0;
}
