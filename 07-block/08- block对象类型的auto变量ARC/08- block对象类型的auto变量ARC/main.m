//
//  main.m
//  07- block对象类型的auto变量1
//
//  Created by chenxiaojie on 2021/7/31.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"


typedef void (^TXBlock)(void);


// ARC 环境
int main(int argc, const char * argv[]) {
    
    // main0.app
    /*
    @autoreleasepool {
        
        TXBlock block;
        
        {
            auto TXPerson *person = [[TXPerson alloc] init]; // person 的 ReferenceCount = 1
            person.age = 10;

            // 这是一个 __NSMallocBlock__ block 存放在堆区，对象不会自动销毁，所以会对 person 产生强引用，
            // 这个时候 person 的 ReferenceCount = 2
            block = ^{
                NSLog(@"person.age = %d", person.age);
            };
            
        }
        // 离开 } person 的 ReferenceCount = 1
        NSLog(@"block = %@", [block class]);// __NSMallocBlock__
    }
    // 这个时候 block 销毁了， person 的 ReferenceCount = 0，才会调用  dealloc 方法
    
    return 0;
     */
    
    @autoreleasepool {
        
        TXBlock block;
        
        {
            auto TXPerson *person = [[TXPerson alloc] init]; // person 的 ReferenceCount = 1
            person.age = 10;

            __weak TXPerson *weakPerson = person;// 这个时候 block 捕获的TXPerson 对象就是 __weak 类型
            block = ^{
                NSLog(@"person.age = %d", weakPerson.age);
            };
            
        }
        // 离开 } person 的 ReferenceCount = 1
        NSLog(@"block = %@", [block class]);// __NSMallocBlock__
    }
    // 这个时候 block 销毁了， person 的 ReferenceCount = 0，才会调用  dealloc 方法
    
    return 0;
    
}
