//
//  main.m
//  01-关联对象-分类添加属性
//
//  Created by chenxiaojie on 2021/7/29.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import "TXPerson+Test.h"

//struct TXPerson_IMPL {
//    Class isa;
//    int _age;
//};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person1 = [[TXPerson alloc] init];
        person1.age = 10;
        person1.weight = 40;
        
        TXPerson *person2 = [[TXPerson alloc] init];
        person2.age = 20;// 20 是存储在 person2 对象中
        person2.weight = 50;// 50 是存储在全局字典对象里面
        
        // 这样虽然可以解决上个 demo 问题，但是一个属性对应一个全局字典，很繁琐，且存在线程安全问题（不同线程同时访问一个对象就会出现）
        // 03-关联对象-分类添加属性 可以通过关联对象来解决此问题
        NSLog(@"person1.age = %d, person1.weight = %d, person2.age = %d, person2.weight = %d",  person1.age, person1.weight, person2.age, person2.weight);
    }
    return 0;
}
