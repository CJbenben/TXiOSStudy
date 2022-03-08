//
//  main.m
//  03-OC对象的分类-meta-class对象
//
//  Created by chenxiaojie on 2021/7/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NSObject+Test.h"

@interface Person : NSObject

+ (void)test;

@end

@implementation Person

+ (void)test {
    NSLog(@"+ [Person test] %p", self);
}

//- (void)test {
//    NSLog(@"- [Person test] %p", self);
//}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Person = %p", [Person class]);
        NSLog(@"MSObject = %p", [NSObject class]);
        
        [Person test];
        [NSObject test];
    }
    return 0;
}
