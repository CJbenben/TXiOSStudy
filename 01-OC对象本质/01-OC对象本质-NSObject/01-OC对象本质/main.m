//
//  main.m
//  01-OC对象本质
//
//  Created by chenxiaojie on 2021/7/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSObject *obj = [[NSObject alloc] init];
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)obj));
        
    }
    return 0;
}
