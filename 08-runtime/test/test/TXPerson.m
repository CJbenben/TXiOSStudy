//
//  TXPerson.m
//  test
//
//  Created by chenxiaojie on 2021/8/24.
//

#import "TXPerson.h"

@implementation TXPerson

- (id)copyWithZone:(NSZone *)zone {
    TXPerson *person = [[TXPerson alloc] init];
    return person;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    TXPerson *person = [[TXPerson alloc] init];
    return person;
}

@end
