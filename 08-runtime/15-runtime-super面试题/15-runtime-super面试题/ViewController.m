//
//  ViewController.m
//  15-runtime-super面试题
//
//  Created by chenxiaojie on 2022/10/28.
//

#import "ViewController.h"
#import "TXPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    TXPerson *person = [[TXPerson alloc] init];
//    [person test];

//    NSObject *object = [[NSObject alloc] init];
//    NSObject *object2 = [[NSObject alloc] init];
//    NSString *str = @"123";
//
//
//    NSLog(@"%p %p %p", str, object, object2);
    
    id cls = [TXPerson class];
    void *obj = &cls;
    
    [(__bridge id)obj test];
    
    
    
    NSLog(@"end");
}


@end
