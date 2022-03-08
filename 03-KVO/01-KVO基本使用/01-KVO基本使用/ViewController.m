//
//  ViewController.m
//  01-KVO基本使用
//
//  Created by chenxiaojie on 2021/7/23.
//

#import "ViewController.h"
#import "TXPerson.h"

@interface ViewController ()

@property (nonatomic, strong) TXPerson *person1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person1 = [[TXPerson alloc] init];
    self.person1.age = 1;
    self.person1.height = 11;
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    [self.person1 addObserver:self forKeyPath:@"height" options:options context:@"123"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person1.age = 10;
    self.person1.height = 20;
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
    [self.person1 removeObserver:self forKeyPath:@"height"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值发生了改变 -> %@ -> %@", object, keyPath, change, context);
}

@end
