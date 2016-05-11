//
//  BViewController.m
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/10.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)getDataMethod{
    NSString *webString = @"http://101.231.75.25:8080/jkms-app-test/product/productDetail.do";
    NSDictionary *parameters = @{@"userId":@"10",@"id":@"1"};
    
    [CJHttpRequest POSTwithUrl:webString parameters:parameters success:^(id responseObject) {
//        SHOWALERT(@"数据获取成功");
        [self addCustomAlertWithMsg:@"数据获取成功"];
    } failure:^(NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
