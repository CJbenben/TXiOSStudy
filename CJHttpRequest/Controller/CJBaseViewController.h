//
//  CJBaseViewController.h
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/9.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJBaseViewController : UIViewController

@property (strong, nonatomic) AFHTTPRequestOperation *operation;

@property (strong, nonatomic) UITableView *tableView;

/**
 *  模型数组
 */
@property (strong, nonatomic) NSMutableArray *dataArray;

/**
 *  当前页
 */
@property (assign, nonatomic) NSInteger currPage;
/**
 *  总条数
 */
@property (assign, nonatomic) NSInteger totalNumber;

- (void)checkWebWeatherInter;

/**
 *  配置父视图UI(tableView)
 */
- (void)configSuperViewUI;

/**
 *  刷新头视图和尾视图(tableView)
 */
- (void)addMJRefreshHeader:(BOOL)isHaveHeader addFooter:(BOOL)isHaveFooter;

//- (void)isOpenAutomaticRefresh:(BOOL)isOpen;
- (void)addCustomAlertWithMsg:(NSString *)message;
@end
