//
//  main.m
//  06-block类型1
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>

void (^block)(void);

void test(void) {
    int age = 10;
    block = ^{
        NSLog(@"age = %d", age);
    };
    NSLog(@"block = %@", [block class]);// __NSStackBlock__
    // 这个 block 是 __NSStackBlock__ 类型，放在 栈上，系统自动分配内存，} 结束就会销毁
}

// 关闭 ARC， 在 MRC 环境运行
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        test();
        block();
        // 关注打印结果 age 值已经错了,这个因为 block 对象在内存中已经销毁，但是
        // __NSMallocBlock__ 类型是存放在堆中，程序员自己管理内存，所以不会销毁
        
        
        
        NSLog(@"-------------------------");
        
        // 那如何把 __NSStackBlock__ 转为 __NSMallocBlock__ 类型？？调用下 copy 方法
        int height = 10;
        void (^block)(void) = [^{
            NSLog(@"========");
        } copy];
        NSLog(@"block = %@", [block class]);// __NSGlobalBlock__ 调用 copy 方法还是   __NSGlobalBlock__  类型
        
        
        void (^block1)(void) = [^{
            NSLog(@"height = %d", height);
        } copy];
        NSLog(@"block1 = %@", [block1 class]);// __NSStackBlock__ 调用 copy 方法变成   __NSMallocBlock__  类型
        
        
        
        void (^block2)(void) = [[^{
            NSLog(@"height = %d", height);
        } copy] copy];
        NSLog(@"block2 = %@", [block2 class]);// __NSMallocBlock__ 调用 copy 方法还是   __NSMallocBlock__  类型，只是引用计数器会 +1
        
        
        
        // 注：在 ARC 环境下，这个 copy 方法，系统会帮我们自动生成
    }
    return 0;
}
