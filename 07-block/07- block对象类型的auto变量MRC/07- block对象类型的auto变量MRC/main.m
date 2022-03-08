//
//  main.m
//  07- block对象类型的auto变量1
//
//  Created by chenxiaojie on 2021/7/31.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"


typedef void (^TXBlock)(void);


// MRC 环境
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TXBlock block;
        
        {
            TXPerson *person = [[TXPerson alloc] init];
            person.age = 10;
            
            
            // 这是一个 __NSStackBlock__ block 存放在栈区，离开 } 对象就销毁了，所以不会对 person 产生强引用
            block = ^{
                NSLog(@"person.age = %d", person.age);
            };
            
            [person release];
        }
        
        NSLog(@"block = %@", [block class]);// __NSStackBlock__
    }
    return 0;
}
