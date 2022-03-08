//
//  NSObject+Test.m
//  03-OC对象的分类-meta-class对象
//
//  Created by chenxiaojie on 2021/7/22.
//

#import "NSObject+Test.h"

@implementation NSObject (Test)

+ (void)test {
    NSLog(@"+ [NSObject test] %p", self);
}

- (void)test {
    NSLog(@"- [NSObject test] %p", self);
}
@end
