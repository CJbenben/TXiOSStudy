//
//  main.m
//  01-block的本质
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        void (^block)(void) = ^{
            NSLog(@"Hello, World!");
        };

        block();
    }
    return 0;
}
