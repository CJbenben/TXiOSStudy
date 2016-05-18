//
//  CJBaseNaviViewController.m
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/17.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "CJBaseNaviViewController.h"

@interface CJBaseNaviViewController ()

@end

@implementation CJBaseNaviViewController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
