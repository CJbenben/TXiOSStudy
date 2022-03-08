//
//  main.m
//  07-atmoic
//
//  Created by chenxiaojie on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *p = [[TXPerson alloc] init];
        // 这句代码时线程安全的
        p.data = [NSMutableArray array];
        
        [p.data addObject:@"1"];
        // [[p data] addObject:@"1"];
        /* 仅仅只是 [p data] 调用 get 方法是安全的，addObject: 方法是不安全的，
         * 当 addOject 的三个方法在不同线程同时调用的时候就会发生问题
         * 但是在 iOS 项目中还是很少使用 atmoic，
         * 因为 setter、get 方法在频繁调用的时候，不停的 加锁，解锁很耗性能
         * 如果确实有加解锁需求，可对对象 p 进行加解锁操作
         */
        [p.data addObject:@"2"];
        [p.data addObject:@"3"];
    }
    return 0;
}
