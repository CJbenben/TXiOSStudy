//
//  main.m
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import "TXPerson+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person1 = [[TXPerson alloc] init];
        person1.age = 10;
        person1.weight = 40;
        
        TXPerson *person2 = [[TXPerson alloc] init];
        person2.age = 20;
        person2.weight = 50;
        
        
        // person2 修改了 weight 值，person1.weight 也发生的改变，因为 setter 方法定义了一个全局变量，那么通过字典存储是否可以实现呢？看 02-关联对象-分类添加属性-字典实现
        NSLog(@"person1.age = %d, person1.weight = %d, person2.age = %d, person2.weight = %d",  person1.age, person1.weight, person2.age, person2.weight);
    }
    return 0;
}
