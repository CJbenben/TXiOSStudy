//
//  main.m
//  17-runtime应用-方法
//
//  Created by chenxiaojie on 2022/11/3.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import <objc/runtime.h> 

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        
        // 方法交换
        Method runMethod = class_getInstanceMethod(object_getClass(person), @selector(run));
        Method testMethod = class_getInstanceMethod([TXPerson class], @selector(test));
        method_exchangeImplementations(runMethod, testMethod);
        
        [person test];
    }
    return 0;
}
