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
    
    
    TXStudent *student = [[TXStudent alloc] init];
    
    BOOL a = [student isMemberOfClass:[TXStudent class]];   // 1
    BOOL b = [student isMemberOfClass:[TXPerson class]];    // 0
    BOOL c = [student isKindOfClass:[TXStudent class]];     // 1
    BOOL d = [student isKindOfClass:[TXPerson class]];      // 1
    
    TXPerson *person = [[TXPerson alloc] init];
    BOOL e = [student respondsToSelector:@selector(test)];
    BOOL f = [person respondsToSelector:@selector(test2)];
    NSObject *obj;
    NSLog(@"1111111");
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"notificationTest" object:nil queue:queue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"note = %@", note);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"begin");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TXPerson *person = [[TXPerson alloc] init];
    [person test2];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationTest" object:person];
}

@end
