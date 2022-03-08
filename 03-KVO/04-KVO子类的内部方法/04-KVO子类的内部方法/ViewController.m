//
//  ViewController.m
//  04-KVO子类的内部方法
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

- (void)printMethodNamesOfClass:(Class)cls {
    unsigned int count;
    // 活动方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    NSMutableString *mutStr = [NSMutableString string];
    for (int i = 0; i<count; i++) {
        Method method = methodList[i];
        // method_getName: 通过 Method 获取 方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        [mutStr appendString:methodName];
        [mutStr appendString:@", "];
    }
    // 释放
    free(methodList);
    
    NSLog(@"%@ = %@", cls, mutStr);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person1 = [[TXPerson alloc] init];
    self.person1.age = 1;
    self.person2 = [[TXPerson alloc] init];
    self.person2.age = 2;
    

    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    
    [self printMethodNamesOfClass:object_getClass(self.person1)];
    [self printMethodNamesOfClass:object_getClass(self.person2)];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    [self.person1 setAge:10];
//    [self.person2 setAge:20];
    
    
    [self.person1 willChangeValueForKey:@"age"];
    [self.person1 didChangeValueForKey:@"age"];
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值发生了改变 -> %@ -> %@", object, keyPath, change, context);
}


@end
