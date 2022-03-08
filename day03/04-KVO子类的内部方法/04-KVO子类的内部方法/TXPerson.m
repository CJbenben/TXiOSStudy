//
//  TXPerson.m
//  01-KVO基本使用
//
//  Created by chenxiaojie on 2021/7/23.
//

#import "TXPerson.h"

@implementation TXPerson

- (void)setAge:(int)age {
    _age = age;
    //NSLog(@"setAge:");
}

//- (void)willChangeValueForKey:(NSString *)key {
//    NSLog(@"willChangeValueForKey:%@", key);
//    [super willChangeValueForKey:key];
//}
//
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"didChangeValueForKey-begin:%@", key);
//    
//    [super didChangeValueForKey:key];
//    
//    NSLog(@"didChangeValueForKey-end:%@", key);
//}
@end
