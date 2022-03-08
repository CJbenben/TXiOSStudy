//
//  NSKVONotifying_TXPerson.m
//  02-KVC的本质
//
//  Created by chenxiaojie on 2021/7/23.
//

#import "NSKVONotifying_TXPerson.h"

@implementation NSKVONotifying_TXPerson

- (void)setAge:(int)age {
//    _NSSetIntValueAndNotify();
}
//
//// 伪代码
//void _NSSetIntValueAndNotify() {
//    [self willChangeValueForKey:@"age"];
//    [super setAge:age];
//    [self didChangeValueForKey:@"age"];
//}
//
//- (Class)class {
//    return [TXPerson class];
//}
//
//- (void)dealloc {
//
//}
//
//- (BOOL) _isKVOA {
//    return YES;
//}

//- (void)didChangeValueForKey:(NSString *)key {
//    // 通知监听器，属性值发生了改变
//    [observe observeValueForKeyPath:key ofObject:self change:nil context:nil];
//}

@end
