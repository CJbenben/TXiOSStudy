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
        TXPerson *person = [[TXPerson alloc] init];
        person.tall = YES;
        person.rich = NO;
        person.handsome = YES;
        NSLog(@"isTall:%d, isRich:%d, isHandsome:%d", person.isTall, person.isRich, person.isHandsome);
    }
    return 0;
}
