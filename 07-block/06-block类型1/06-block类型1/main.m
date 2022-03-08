//
//  main.m
//  06-block类型1
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>

// block 是对象
void test(void) {
    void (^block1)(void) = ^{
        NSLog(@"block1------");
    };
    // block 既然是对象，那么可以调用 class 方法
    NSLog(@"block1 = %@", [block1 class]);  // __NSGlobalBlock__
    NSLog(@"block1父类 = %@", [[block1 class] superclass]);// NSBlock
    NSLog(@"block1父类的父类 = %@", [[[block1 class] superclass] superclass]);// NSObject 这也验证了 block 是对象的说法
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //test();
        
        void (^block1)(void) = ^{
            
        };
        NSLog(@"block1 = %@", [block1 class]);// __NSGlobalBlock__
        
        
        int age = 10;
        void (^block2)(void) = ^{
            NSLog(@"age = %d", age);
        };
        NSLog(@"block2 = %@", [block2 class]);// __NSMallocBlock__
        
        
        NSLog(@"block3 = %@", [^{
            NSLog(@"age = %d", age);
        } class]);// __NSStackBlock__
    }
    return 0;
}
