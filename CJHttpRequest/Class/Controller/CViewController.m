//
//  CViewController.m
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/17.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "CViewController.h"

#define kCJWEATHER_KEY              @"8880f93f279f023e0f0820bf48c74875"         //聚合数据key

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getRequest];
}


- (void)getRequest{
    [self.HUD showInView:self.view];
    
//    NSString *string = @"http://v.juhe.cn/weather/index?format=2&cityname=%E8%8B%8F%E5%B7%9E&key=您申请的KEY";
    
    NSString *webString = @"http://v.juhe.cn/weather/index?";
    
    NSDictionary *parameters = @{@"cityname":@"上海",@"key":kCJWEATHER_KEY,@"format":@"1",@"dtype":@"json"};
    
    [CJHttpRequest GETwithUrl:webString parameters:parameters success:^(id responseObject) {
        
        [CJShowAlertMsg cjShowAlertMessage:@"数据获取成功"];
        [self.HUD dismissAnimated:YES];
        
    } failure:^(NSError *error) {
        
        [self.HUD dismissAnimated:YES];
        
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
