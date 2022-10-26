//
//  ViewController.m
//  05-runtime-位运算
//
//  Created by chenxiaojie on 2022/10/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef enum {
    TXOptionsNone   = 0, //0b0000
    TXOptionsOne    = 1<<1, //0b0001
    TXOptionsTwo    = 1<<2, //0b0010
    TXOptionsThree  = 1<<3, //0b0100
    TXOptionsFour   = 1<<4, //0b1000
} TXOptions;

@implementation ViewController

/*
 | 是如何设计的，自己怎么设计这种运算？
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setOptions:TXOptionsOne | TXOptionsFour];
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self addObserver:self forKeyPath:@"age" options:options context:nil];
}

- (void)setOptions:(TXOptions)options {
    if (options & TXOptionsOne) {
        NSLog(@"包含了TXOptionsOne");
    }
    if (options & TXOptionsTwo) {
        NSLog(@"包含了TXOptionsTwo");
    }
    if (options & TXOptionsThree) {
        NSLog(@"包含了TXOptionsThree");
    }
    if (options & TXOptionsFour) {
        NSLog(@"包含了TXOptionsFour");
    }
}


@end
