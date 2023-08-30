//
//  main.m
//  14-runtime-class面试题
//
//  Created by chenxiaojie on 2022/10/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"

/*
+ (BOOL)isMemberOfClass:(Class)cls {
    return self->ISA() == cls;
}

- (BOOL)isMemberOfClass:(Class)cls {
    return [self class] == cls;
}

+ (BOOL)isKindOfClass:(Class)cls {
    for (Class tcls = self->ISA(); tcls; tcls = tcls->getSuperclass()) {
        if (tcls == cls) return YES;
    }
    return NO;
}

- (BOOL)isKindOfClass:(Class)cls {
    for (Class tcls = [self class]; tcls; tcls = tcls->getSuperclass()) {
        if (tcls == cls) return YES;
    }
    return NO;
}
*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [TXPerson new];
        BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res3 = [[TXPerson class] isKindOfClass:[TXPerson class]];
        BOOL res4 = [[TXPerson class] isMemberOfClass:[TXPerson class]];
        
        NSLog(@"%d, %d, %d, %d", res1, res2, res3, res4);
    }
    return 0;
}
