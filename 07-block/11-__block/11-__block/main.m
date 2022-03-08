//
//  main.m
//  11-__block
//
//  Created by chenxiaojie on 2021/7/31.
//

#import <Foundation/Foundation.h>

typedef void(^TXBlock) (void);

struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};

struct __Block_byref_age_0 {
  void *__isa; // 8个字节
 struct __Block_byref_age_0 *__forwarding;// 8个字节
 int __flags;// 4个字节
 int __size;// 4个字节
 int age;
};

struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(void);
  void (*dispose)(struct __main_block_impl_0*);
};

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  struct __Block_byref_age_0 *age; // by ref

};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int age = 10;
        TXBlock block = ^{
            // 如果需要在 block 里面修改 age 变量的值
            // 1.可以通过 static int age = 10  block 捕获的是 age 的指针，所以可以修改，
            // 2.把 age 改为全局变量，block 虽然不捕获，但是 block 里面可以访问，自然可以修改
            // 3.使用 __block 定义 age
            age = 20;
            NSLog(@"这里需要修改 age 的值 = %d", age);
        };
        
        //block();
        struct __main_block_impl_0 structBlock = *(__bridge struct __main_block_impl_0 *)block;
        
        
        NSLog(@"age = %p", &age);
        
    }
    return 0;
}
