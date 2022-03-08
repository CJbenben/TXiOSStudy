//
//  main.m
//  03-OC对象的分类-meta-class对象
//
//  Created by chenxiaojie on 2021/7/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 实例对象有多个
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        // 注意：类对象只有一个
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = object_getClass(object1);
        Class objectClass4 = object_getClass(object2);
        Class objectClass5 = [NSObject class];
        
        NSLog(@"%p   %p   %p   %p  %p  %p %p", object1, object2, objectClass1, objectClass2, objectClass3, objectClass4, objectClass5);
        
        
        // 元类对象,将类对象当做参数传进去，获得元类对象 也只有一个
        Class objectMetaClass = object_getClass([NSObject class]);
        NSLog(@"objectMetaClass %p", objectMetaClass);
        
        
        BOOL result1 = class_isMetaClass([NSObject class]);
        BOOL result2 = class_isMetaClass(objectMetaClass);
        
        NSLog(@"result1 = %d, 4result2 = %d", result1, result2);
    }
    return 0;
}
