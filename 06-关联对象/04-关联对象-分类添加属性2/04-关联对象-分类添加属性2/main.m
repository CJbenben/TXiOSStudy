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
        person1.weight = 40;
        person1.name = @"jack";
        
        TXPerson *person2 = [[TXPerson alloc] init];
        person2.weight = 50;
        person2.name = @"kangkang";
        
        
        NSLog(@"person1.weight = %d, person1.name = %@", person1.weight, person1.name);
        NSLog(@"person2.weight = %d, person2.name = %@", person2.weight, person2.name);
    }
    return 0;
}
