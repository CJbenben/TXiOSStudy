//
//  TXPerson.m
//  RuntimeDemo
//
//  Created by chenxiaojie on 2022/3/7.
//

#import "TXPerson.h"
#import <objc/runtime.h>
#import "TXCat.h"

@implementation TXPerson

//- (void)test2 {
//    NSLog(@"%s", __func__);
//}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(test2)) {
//        class_addMethod([self class], sel, class_getMethodImplementation(self, @selector(action:)), "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//- (void)action:(int)str {
//    NSLog(@"self = %@, FUNC = %p, str == %d", self, (const char *)__func__, str);
//}



//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(test2)) {
//        TXCat *cat = [[TXCat alloc] init];
//        return cat;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}


//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    return [[TXCat alloc] methodSignatureForSelector:aSelector];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    if (anInvocation.selector == @selector(test2)) {
//        [anInvocation invokeWithTarget:[TXCat new]];
//    }else{
//        [super forwardInvocation:anInvocation];
//    }
//}

@end
