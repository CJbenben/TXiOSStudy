//
//  main.m
//  07-runtime-method
//
//  Created by chenxiaojie on 2022/10/26.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MJClassInfo.h"
#import "TXPerson.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        TXPerson *person = [[TXPerson alloc] init];
        
        mj_objc_class *cls = (__bridge mj_objc_class *)[TXPerson class];
        class_rw_t *data = cls->data();
        
        
        [person test];
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
