//
//  main.m
//  01-Category基本使用
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson+Test.h"
#import "TXPerson+Eat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        [person run];
        [person test];
        [person eat];
    }
    return 0;
}
