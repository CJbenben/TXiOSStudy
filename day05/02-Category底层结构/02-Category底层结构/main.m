//
//  main.m
//  02-Category底层结构
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson+Test.h"
#import "TXPerson+Eat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        // 可以调用 run 方法不难理解，因为 run 方法存在于 类对象中，person->isa 指向的就是类对象，所以可以找到 run 方法
        [person run];
        
        // 但是为什么可以调用 test 和 eat 方法呢？
        [person test];
        [person eat];
        
        /*
         OC 中方法的调用，实际上是给对象发消息 objc_msgSend(person, @selector(eat))
         category 会在运行时，通过 runtime 动态将分类方法合并到类对象中，这个需要参考下 objc4 的源码
         */
    }
    return 0;
}
