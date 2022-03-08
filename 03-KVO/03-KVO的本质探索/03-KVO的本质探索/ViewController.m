//
//  ViewController.m
//  03-KVC的本质探索
//
//  Created by chenxiaojie on 2021/7/23.
//

#import "ViewController.h"
#import "TXPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) TXPerson *person1;
@property (nonatomic, strong) TXPerson *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person1 = [[TXPerson alloc] init];
    self.person1.age = 1;
    self.person2 = [[TXPerson alloc] init];
    self.person2.age = 2;
    
    NSLog(@"person添加KVO监听之前 - %@, %@", object_getClass(self.person1), object_getClass(self.person2));// TXPerson, TXPerson
    
    // methodForSelector 此方法返回一个地址，实现此方法的地址。可通过 p (IMP)0x10a86279f 查看
    NSLog(@"person添加KVO监听之前 - %p, %p",
          [self.person1 methodForSelector:@selector(setAge:)],
          [self.person2 methodForSelector:@selector(setAge:)]);// 0x10a54ce60, 0x10a54ce60
    
    
    
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    
    
    
    NSLog(@"person添加KVO监听之后 - %@, %@", object_getClass(self.person1), object_getClass(self.person2));// NSKVONotifying_TXPerson, TXPerson
    NSLog(@"person添加KVO监听之后 - %p, %p",
          [self.person1 methodForSelector:@selector(setAge:)],
          [self.person2 methodForSelector:@selector(setAge:)]);// 0x10a86279f, 0x10a54ce60
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // self.person1 已经不是 TXPerson 类，添加监听后 runtime 在运行时会创建一个TXPerson 的子类 NSKVONotifying_TXPerson
    
//    self.person1.age = 10;
//    self.person2.age = 20;
    [self.person1 setAge:10];
    [self.person2 setAge:20];
    
    /*
     (lldb) p self.person1.isa
     (Class) $4 = NSKVONotifying_TXPerson
       Fix-it applied, fixed expression was:
         self.person1->isa
     (lldb) p self.person2.isa
     (Class) $5 = TXPerson
       Fix-it applied, fixed expression was:
         self.person2->isa
     
     */
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值发生了改变 -> %@ -> %@", object, keyPath, change, context);
}


@end
