//
//  main.m
//  08-runtime-方法缓存
//
//  Created by chenxiaojie on 2022/10/26.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import "MJClassInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        
        mj_objc_class *cls = (__bridge mj_objc_class*)[TXPerson class];
        
        [person personTest];
        
        NSLog(@"end");
    }
    return 0;
}
