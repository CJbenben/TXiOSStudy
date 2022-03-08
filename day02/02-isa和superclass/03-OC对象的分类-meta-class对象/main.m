//
//  main.m
//  03-OC对象的分类-meta-class对象
//
//  Created by chenxiaojie on 2021/7/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject

+ (void)test;

@end

@implementation Person

+ (void)test {
    NSLog(@"+ [Person test] %p", self);
}

//- (void)test {
//    NSLog(@"- [Person test] %p", self);
//}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        Class personClass = [Person class];
        Class personMetaClass = object_getClass(personClass);
        
        //  (person->isa & ISA_MASK) = personClass
        
        
        /*
         (lldb) p/x (long)person->isa
         (long) $8 = 0x011d800100008129
         (lldb) p/x (long)personClass
         (long) $9 = 0x0000000100008128
         (lldb) p/x 0x011d800100008129 & 0x007ffffffffffff8ULL
         (unsigned long long) $10 = 0x001d800100008128
         (lldb)
         */
    }
    return 0;
}
