//
//  main.m
//  01-block的本质
//
//  Created by chenxiaojie on 2021/7/30.
//

#import <Foundation/Foundation.h>

int abc = 10;
static int height = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void (^block)(void) = ^{
            NSLog(@"abc = %d, height = %d", abc, height);
        };
        
        abc = 20;
        height = 20;
        
        block();
    }
    return 0;
}
