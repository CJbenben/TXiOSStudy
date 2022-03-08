//
//  main.m
//  06-block类型1
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>


int height = 100;

// 关闭 ARC 在 MRC 环境运行
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 没有访问 auto 变量的都是 __NSGlobalBlock__ 类型（包括访问了 static 的局部变量、访问了全局变量 都是这个类型）
        void (^block)(void) = ^{
            
        };
        NSLog(@"block = %@", [block class]);// __NSGlobalBlock__
        
        
        static int abc = 10;
        void (^block1)(void) = ^{
            NSLog(@"abc = %d", abc);
        };
        NSLog(@"block1 = %@", [block1 class]);// __NSGlobalBlock__
        
        
        
        void (^block2)(void) = ^{
            NSLog(@"height = %d", height);
        };
        NSLog(@"block2 = %@", [block2 class]);// __NSGlobalBlock__
        
        
        
        
        
        
        // 如果访问了 auto 变量，__NSStackBlock__ 类型
        int age = 10;
        void (^block3)(void) = ^{
            NSLog(@"age = %d", age);
        };
        NSLog(@"block3 = %@", [block3 class]);// __NSStackBlock__
        
    }
    return 0;
}
