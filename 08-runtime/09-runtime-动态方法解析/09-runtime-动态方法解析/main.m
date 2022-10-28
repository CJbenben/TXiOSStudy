//
//  main.m
//  09-runtime-动态方法解析
//
//  Created by chenxiaojie on 2022/10/27.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        [person test];
        
        [TXPerson test];
    }
    return 0;
}
