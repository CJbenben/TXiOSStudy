//
//  ViewController.m
//  test
//
//  Created by chenxiaojie on 2021/8/24.
//

#import "ViewController.h"
#import "TXPerson.h"

@interface ViewController ()

@property (nonatomic, strong) TXPerson *sperson;
@property (nonatomic, retain) TXPerson *rperson;
@property (nonatomic, copy) TXPerson *cperson;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TXPerson *person = [[TXPerson alloc] init];
    self.sperson = person;
    self.rperson = person;
    self.cperson = person;
    
    NSLog(@"\n sperson = %p, \n sperson = %p,\n rperson = %p,\n cperson = %p", person, self.sperson, self.rperson, self.cperson);
}

@end
