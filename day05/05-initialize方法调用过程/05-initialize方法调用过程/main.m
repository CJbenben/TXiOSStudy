//
//  main.m
//  04-load方法调用过程
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import "TXStudent.h"
#import "TXTeacher.h"
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
        /*
         initialize 方法只会在类第一次接收到消息的时候调用，所以只会调用一次
         如果分类中也实现了 initialize 方法，为什么调用分类方法，而不调用类里面的 initialize 方法？
         这个就是消息分发机制的问题了，既然只调用一次，那肯定是通过 objc_msgSend 函数来调用，这个和 category 就大致相同了（后编译，先调用）
         具体原因需要参考源码分析 objc-runtime-new.mm -> class_getInstanceMethod -> IMP lookUpImpOrForward -> realizeAndInitializeIfNeeded_locked
         */
        
        
        
        [TXStudent alloc];
        [TXTeacher alloc];
        
        /*
        if ([TXStudent class] 没有初始化) {
            if ([TXPerson class] 没有初始化) {
                objc_msgSend([TXPerson class], @selector(initialize));
            }
            objc_msgSend([TXStudent class], @selector(initialize));
        }
        if ([TXTeacher class] 没有初始化) {
            if ([TXPerson class] 没有初始化) {
                objc_msgSend([TXPerson class], @selector(initialize));
            }
            objc_msgSend([TXTeacher class], @selector(initialize));
        }
        */
        
        
        // 执行万伪代码，最终执行结果：
//        objc_msgSend([TXPerson class], @selector(initialize));
//        objc_msgSend([TXStudent class], @selector(initialize));
//        objc_msgSend([TXTeacher class], @selector(initialize));
        
        
        
        
    }
    return 0;
}
