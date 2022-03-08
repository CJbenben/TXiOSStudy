//
//  main.m
//  04-load方法调用过程
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import <objc/runtime.h>

void printMethodNamesOfClass(Class cls) {
    unsigned int count;
    // 活动方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    NSMutableString *mutStr = [NSMutableString string];
    for (int i = 0; i<count; i++) {
        Method method = methodList[i];
        // method_getName: 通过 Method 获取 方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        [mutStr appendString:methodName];
        [mutStr appendString:@", "];
    }
    // 释放
    free(methodList);
    
    NSLog(@"%@ = %@", cls, mutStr);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // TXPerson = load, load, load, 这里打印了三个 load 方法
        printMethodNamesOfClass(object_getClass([TXPerson class]));
        
        
        /*
         在 category 中，如果有和类中同名的方法，只会调用 category 的方法
         但是 load 方法为啥都调用了？
         他们顺序是什么规律？
         这个需要参考源码分析 objc_os.mm -> _objc_init -> load_images
         */
    }
    return 0;
}
