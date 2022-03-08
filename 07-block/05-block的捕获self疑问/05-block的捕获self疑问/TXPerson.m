//
//  TXPerson.m
//  05-block的捕获self疑问
//
//  Created by chenxiaojie on 2021/7/30.
//

#import "TXPerson.h"

@implementation TXPerson

// 请问：test 方法被调用的时候，block 捕获了 self 对象么？
- (void)test {
    
    void (^block)(void) = ^{
        NSLog(@"name = %@", _name);
        //相当于 NSLog(@"name = %@", self->_name);
    };
    
    block();
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

@end
