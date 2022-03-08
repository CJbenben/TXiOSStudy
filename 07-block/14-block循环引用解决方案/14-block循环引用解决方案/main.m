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
//        TXPerson *person = [[TXPerson alloc] init];
//        person.age = 10;
        
//        // 第一种方案：使用 __weak   不会产生强引用，指向对象销毁时，会自动置为 nil 参考 main0.app
//        __weak TXPerson *weakPerson = person;
//        __weak typeof(person) weakPerson = person;// 效果同上
//        person.block = ^{
//            NSLog(@"age = %d", weakPerson.age);
//        };
//
        
//        // 第二种方案：使用 __unsafe_unretained  不会产生强引用，指向对象销毁时，指针存储的地址值不变（存在野指针现象）
//        __unsafe_unretained typeof(person) weakPerson = person;
//        person.block = ^{
//            NSLog(@"age = %d", weakPerson.age);
//        };
        
        // 第三种方案：使用 __block 缺点：这个block必须要调用，且里面要手动置为 nil  参考 main1.app
        __block TXPerson *person = [[TXPerson alloc] init];
        person.age = 10;
        person.block = ^{
            NSLog(@"age = %d", person.age);
            person = nil;
        };
        person.block();
    }
    NSLog(@"------------------");
    
    return 0;
}
