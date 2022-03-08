//
//  main.m
//  01-OC对象的分类
//
//  Created by chenxiaojie on 2021/7/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa;
};

struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
};

@interface Person : NSObject
{
    @public
    int _no;
}
@end

@implementation Person

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *per = [[Person alloc] init];
        NSLog(@"%zd", class_getInstanceSize([Person class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)per));
    }
    return 0;
}
