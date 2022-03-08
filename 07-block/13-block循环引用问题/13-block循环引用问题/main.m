//
//  main.m
//  13-block循环引用
//
//  Created by chenxiaojie on 2021/8/4.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        person.age = 10;
        // TXPerson 里面有个成员变量 _block 指向的是 Block 变量
        person.block = ^{
            // block 底层内部有个 person 对象指向 TXPerson
            NSLog(@"age = %d", person.age);
        };
    }
    NSLog(@"------------------");
    return 0;
}
