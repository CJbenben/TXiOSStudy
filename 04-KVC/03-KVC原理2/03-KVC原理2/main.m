//
//  main.m
//  03-KVC原理2
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
        
        // kvc 内部也会通知 kvo 的监听
        // 具体操作：内部肯定调用了 willChangeValueForKey 和 didChangeValueForKey 方法
        [person setValue:@(10) forKey:@"age"];
        
        //NSLog(@"age = %d", person->_age);
        
        [person removeObserver:observer forKeyPath:@"age"];
    }
    return 0;
}
