//
//  main.m
//  05-block的捕获self疑问
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        [person test];
    }
    return 0;
}
