//
//  main.m
//  02-OC对象的分类-class对象
//
//  Created by chenxiaojie on 2021/7/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
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
        // 0x107b4e1e0   0x107b4cb90   0x7fff88b62cc8   0x7fff88b62cc8  0x7fff88b62cc8  0x7fff88b62cc8 0x7fff88b62cc8
    }
    return 0;
}
