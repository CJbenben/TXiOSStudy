//
//  TXObserver.m
//  02-KVC原理
//
//  Created by chenxiaojie on 2021/7/28.
//

#import "TXObserver.h"

@implementation TXObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"KVO监听到的改变 - %@", change);
}

@end
