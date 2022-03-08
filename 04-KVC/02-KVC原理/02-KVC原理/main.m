//
//  main.m
//  02-KVC原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import "TXObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXObserver *observer = [[TXObserver alloc] init];
        TXPerson *person = [[TXPerson alloc] init];
        [person addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        /*
         kvc 修改变量值会执行 KVO 的监听
         因为：setValue: forKey: 方法内部会重写 setKey，_setKey 方法
         */
        [person setValue:@(10) forKey:@"age"];
        
        NSLog(@"age = %d", person.age);
        
        [person removeObserver:observer forKeyPath:@"age"];
    }
    return 0;
}
