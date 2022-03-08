//
//  main.m
//  04-KVC取值原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import <Foundation/Foundation.h>
#import "TXPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXPerson *person = [[TXPerson alloc] init];
        // _key _isKey key isKey
        person->_age = 10;
//        person->_isAge = 11;
//        person->age = 12;
//        person->isAge = 13;
        
        // valueForKey:内部实现逻辑参考图片
        NSLog(@"age = %@", [person valueForKey:@"age"]);
    }
    return 0;
}
