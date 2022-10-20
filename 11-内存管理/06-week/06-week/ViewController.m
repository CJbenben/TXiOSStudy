//
//  ViewController.m
//  06-week
//
//  Created by chenxiaojie on 2022/10/12.
//

#import "ViewController.h"
#import "TXPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
               
    __strong TXPerson *p1;
    __weak TXPerson *p2;
    __unsafe_unretained TXPerson *p3;
    
    NSLog(@"1111");
    {
        TXPerson *person = [[TXPerson alloc] init];
//        p1 = person;
//        p2 = person;
        p3 = person;
    }
    NSLog(@"2222- %@", p2);
    
    /*
     __weak 和 __unsafe_unretained 区别
     1. __unsafe_unretained 是不安全的
     2. 执行 NSLog(@"2222- %@", p3); 会崩溃，因为p3出了{}，对象已经销毁了，
        但是执行到 NSLog(@"2222- %@", p3); 代码时，p3的地址还是指向 person，
        也就是并没有置为nil，从而出现野指针现象
     3.但是 使用 __weak 时，当对象销毁时，runtime 会QW帮忙让让对象置为nil，原理参考 runtime 源码
     */
}

@end
