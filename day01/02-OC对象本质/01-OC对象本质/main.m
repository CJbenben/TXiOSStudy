//
//  main.m
//  01-OC对象本质
//
//  Created by chenxiaojie on 2021/7/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>


struct Student_IMPL {
    Class isa;
    int _no;
    int _age;
};

@interface Student : NSObject
{
    @public
    int _no;
    int _age;
    //NSString *name;
}
@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Student *stu = [[Student alloc] init];
        stu->_no = 4;
        stu->_age = 12;
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)stu));
        
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)stu;
        NSLog(@"no is %d, age is %d", stuImpl->_no, stuImpl->_age);
    }
    return 0;
}
