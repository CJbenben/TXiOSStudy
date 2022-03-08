//
//  main.m
//  01-runtime
//
//  Created by chenxiaojie on 2021/8/4.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSLog(@"%zd", class_getInstanceSize([TXPerson class]));
        
        TXPerson *person = [[TXPerson alloc] init];
        NSLog(@"isTall:%d, isRich:%d, isHandsome:%d", person.isTall, person.isRich, person.isHandsome);
    }
    return 0;
}
