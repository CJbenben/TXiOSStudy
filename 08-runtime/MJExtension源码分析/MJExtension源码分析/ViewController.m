//
//  ViewController.m
//  MJExtension源码分析
//
//  Created by chenxiaojie on 2022/11/2.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "TXStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"viewDidLoad");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSDictionary *json = @{
        @"age": @10,
        @"no": @123123,
        @"name": @"chenxiaojie",
        @"detail": @"description",
        @"cat": @{
            @"city": @"苏州"
        }
    };
    
    TXStudent *student = [TXStudent mj_objectWithKeyValues:json];
    NSLog(@"123");
}

@end
