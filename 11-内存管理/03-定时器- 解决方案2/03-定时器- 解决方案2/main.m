//
//  main.m
//  01-定时器
//
//  Created by chenxiaojie on 2021/10/13.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "TXProxy.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    
    ViewController *vc = [[ViewController alloc] init];
    TXProxy *proxy = [TXProxy proxyWithTarget:vc];
    
    
    // 如果 TXProxy 继承 NSProxy 则打印结果为：1  NSProxy 内部的 isKindOfClass 完成了消息转发，实际上还是调用 vc 的 isKindOfClass 方法
    // 如果 TXProxy 继承 NSObject 则打印结果为：0
    NSLog(@"%d", [proxy isKindOfClass:[ViewController class]]);
    
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
