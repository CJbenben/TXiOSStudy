//
//  main.m
//  01-block的本质
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>

void (^block)(void);

void test(void) {
    auto int abc = 10;
    static int height = 30;
    
    block = ^(){
        NSLog(@"abc = %d, height = %d", abc, height);
    };
    abc = 20;
    height = 40;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        test();
        block();
        
        // main2.cpp
//        /*
//         auto：自动变量，值传递，超过作用域会自动销毁，默认就是 auto
//         static：block 将补获值的地址，指针传递
//         */
//        auto int abc = 10;
//        static int height = 30;
//
//        void (^block)(void) = ^(){
//            NSLog(@"abc = %d, height = %d", abc, height);
//        };
//        abc = 20;
//        height = 40;
//
//        block();
        
        
        // main1.cpp
//        void (^block)(int, int) = ^(int a, int b){
//            NSLog(@"a = %d, b = %d", a, b);
//        };
//
//        block(10, 20);
        
    }
    return 0;
}
