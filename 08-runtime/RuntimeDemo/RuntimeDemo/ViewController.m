//
//  ViewController.m
//  RuntimeDemo
//
//  Created by chenxiaojie on 2022/3/7.
//

#import "ViewController.h"
#import "TXStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"begin");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TXPerson *person = [[TXPerson alloc] init];
    [person test2];
}

@end
