//
//  ViewController.m
//  16-runtime应用-访问私有成员变量
//
//  Created by chenxiaojie on 2022/11/2.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField.placeholder = @"请输入用户名";
    
    // 访问 UITextField 类里面私有成员变量
    unsigned int count;
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@", name);
    }
    
    
    NSLog(@"---------------");
    
    
    // iOS13之后为了安全，不能使用了
    UILabel *placeholderLabel = [self.textField valueForKeyPath:@"_placeholderLabel"];
    placeholderLabel.textColor = [UIColor redColor];
//    [self.textField setValue:[UIColor redColor] forKey:@"_placeholderLabel.textColor"];
}


@end
