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
//            NSLog(@"block -- %@", [block class]);
//        }
        
//        {
//            TXPerson *person = [[TXPerson alloc] init];
//            __weak TXPerson *weakPerson = person;
//            block = ^{
//                NSLog(@"person = %@", weakPerson);
//            };
//        }
        
        /**
         ARC 环境下：person对象并不会销毁。因为：block内部会强引用 __Block_byref_person_0 对象，
                    __Block_byref_person_0 也会强引用 person
         */
//        {
//            __block TXPerson *person = [[TXPerson alloc] init];
//            block = ^{
//                NSLog(@"person = %@", person);
//            };
//        }
        
        // RMC 环境下：person对象会销毁（即使__NSStackBlock__调用了copy，已经在堆上面了）这个需要注意下
//        __block TXPerson *person = [[TXPerson alloc] init];
//        block = [^{
//            NSLog(@"person = %@", person);
//        } copy];
//        NSLog(@"block - %@", [block class]);
//        [person release];
        

//        {
//            __block TXPerson *person = [[TXPerson alloc] init];
//            __weak TXPerson *weakPerson = person;
//            block = ^{
//                NSLog(@"person = %@", weakPerson);
//            };
//        }
        
        
        {
            TXPerson *person = [[TXPerson alloc] init];
            __block __weak TXPerson *weakPerson = person;
            block = ^{
                NSLog(@"person = %@", weakPerson);
            };
        }
        
        block();
        
        
    }
    return 0;
}
