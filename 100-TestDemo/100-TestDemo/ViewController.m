//
//  ViewController.m
//  RuntimeDemo
//
//  Created by chenxiaojie on 2022/3/7.
//

#import "ViewController.h"
#import "TXStudent.h"
#import "TXAddress.h"

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
    //[person test2];
    
    //[person setValue:@1221 forUndefinedKey:@"age"];
    
    NSLog(@"end");
    
    TXAddress *add = [[TXAddress alloc] init];
    [add setValue:nil forKey:@"city3"];
//    NSArray* arr = @[@"country",@"province",@"city",@"district"];
//    NSDictionary* dict = [add dictionaryWithValuesForKeys:arr]; //把对应key所有的属性全部取出来
//    NSLog(@"%@",dict);
//
//    //字典转模型
//    NSDictionary* modifyDict = @{@"country":@"USA",@"province":@"california",@"city":@"Los angle"};
//    [add setValuesForKeysWithDictionary:modifyDict];            //用key Value来修改Model的属性
//    NSLog(@"country:%@  province:%@ city:%@",add.country,add.province,add.city);
    
}

@end
