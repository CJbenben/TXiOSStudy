//
//  ViewController.m
//  05-KVO修改成员变量
//
//  Created by chenxiaojie on 2021/7/23.
//

#import "ViewController.h"
#import "TXPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) TXPerson *person1;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.person1 = [[TXPerson alloc] init];
    self.person1.age = 1;
    

    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[self.person1 willChangeValueForKey:@"age"];
    
    // 直接修改成员变量的值，不会触发 KVO 监听，因为没有重写 setter 方法
    self.person1->_age = 2;
    //[self.person1 didChangeValueForKey:@"age"];
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值发生了改变 -> %@ -> %@", object, keyPath, change, context);
}

@end
