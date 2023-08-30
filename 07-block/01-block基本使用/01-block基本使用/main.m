//
//  main.m
//  01-block基本使用
//
//  Created by chenxiaojie on 2021/7/29.
//

#import <Foundation/Foundation.h>

struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;// block函数体的指针
};

struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
};

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  int age;
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        ^{
//            NSLog(@"this is a block");
//        };
        
        int age = 20;
                           
        // 1.block 本质上也是一个 OC 对象，底层也是结构体（__main_block_impl_0），里面也有一个 isa 指针
        void (^block)(int, int) = ^(int a, int b) {
            NSLog(@"this is a block - %d", age);
            NSLog(@"this is a block - a + b = %d", a+b);
            NSLog(@"this is a block");
            NSLog(@"this is a block");
            NSLog(@"this is a block");
        };
        
        
        
        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
        // 2.block 是封装了函数调用 以及 函数调用环境的 OC 对象（age）
        // blockStruct.age = 20;
        
        block(10, 11);
    }
    return 0;
}
