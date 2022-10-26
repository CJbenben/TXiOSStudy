//
//  main.m
//  06-runtime-isa每一位存储内容
//
//  Created by chenxiaojie on 2022/10/26.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TXPerson.h"
#import <objc/runtime.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        TXPerson *person = [[TXPerson alloc] init];
        objc_setAssociatedObject(person, @"name", @"chenxiaojie", OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        
        __weak typeof (TXPerson) *weakPerson = person;
        
        
        
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
