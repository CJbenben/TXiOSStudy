//
//  main.m
//  09-block的copy情景
//
//  Created by chenxiaojie on 2021/7/31.
//

#import <Foundation/Foundation.h>

typedef void (^TXBlock)(void);

TXBlock myblock(void) {
    int age = 10;
    return ^{
        NSLog(@"age = %d", age);
    };
}

// 这些场景下 ARC 会自动帮我调用 copy 方法
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1.block 作为函数的返回值
        TXBlock block = myblock();
        block();
        
        NSLog(@"block = %@", [block class]);// __NSMallocBlock__
        
        
        int age = 10;
        // 2.把 block 赋值给 __strong 指针的变量
        TXBlock block2 = ^{
            NSLog(@"age = %d", age);
        };
        NSLog(@"block2 = %@", [block2 class]);// __NSMallocBlock__
        
        
        // 3. cocoaAPI中包含 UsingBlock 方法参数时
        NSArray *array = [NSArray array];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
        }];
        
        // 4.block 作为 GCD API的方法参数时
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
        
        
    }
    return 0;
}
