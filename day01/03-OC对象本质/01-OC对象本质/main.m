//
//  main.m
//  01-OC对象本质
//
//  Created by chenxiaojie on 2021/7/21.
//。

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa;
};

struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _height;
};

struct Student_IMPL {
    struct Person_IMPL Person_IVARS; // 8个字节
    int _age;// 4个字节
};


@interface Person : NSObject
{
    @public
    int _no;
}
@property (nonatomic, assign) int height;
@end

@implementation Person

@end

@interface Student : Person
{
    @public
    int _age;
}
@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *per = [[Person alloc] init];
        NSLog(@"%zd", class_getInstanceSize([Person class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)per));
        
        Student *stu = [[Student alloc] init];
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)stu));
        

    }
    return 0;
}
