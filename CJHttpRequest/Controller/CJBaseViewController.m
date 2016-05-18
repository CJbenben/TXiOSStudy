//
//  CJBaseViewController.m
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/9.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "CJBaseViewController.h"

NSString *kReachabilityChangedNotification = @"kNetworkReachabilityChangedNotification";

@interface CJBaseViewController ()<UITableViewDataSource, UITableViewDelegate>
/**
 *  网络状态
 */
@property (assign, nonatomic) AFNetworkReachabilityStatus networkState;

@property (strong, nonatomic) UIView *bgView;

@property (assign, nonatomic) BOOL isCheckState;
/**
 *  不是表格、子类重写
 */
- (void)getDataMethod;

/**
 *  获取表格数据、子类重写
 */
- (void)getDataWithTableView;
@end

@implementation CJBaseViewController
#pragma mark -
#pragma mark - 懒加载
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)configSuperViewFrame:(CGRect)frame{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self checkWebWeatherInter];
}


- (void)addMJRefreshHeader:(BOOL)isHaveHeader addFooter:(BOOL)isHaveFooter{
    if (isHaveHeader) {
        [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        
        [self.tableView.header beginRefreshing];
    }
    if (isHaveFooter) {
        [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    
}

- (void)headerRereshing{
    NSLog(@"子类需要重写getDataWithTableView、下拉刷新");
    [self.dataArray removeAllObjects];
    [self checkNetworkState];
    [self.tableView.footer endRefreshing];
}

- (void)footerRereshing{
    NSLog(@"子类需要重写getDataWithTableView、上拉加载");
    [self checkNetworkState];
}

- (void)checkNetworkState{
    if (!self.dataArray.count) {
        self.currPage = 1;
    }else{
        self.currPage ++;
    }
    [self getDataWithTableView];
}

- (void)getDataWithTableView{
    NSLog(@"刷新有网络，子类需要重写加载数据");
}


#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"子类需要重写Section");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"子类需要重写numberOfRowsInSection");
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"子类需要重写cellForRowAtIndexPath");
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HidenKeybord;
}












/*
- (void)checkNetworkState2{
    self.networkState = AFNetworkReachabilityStatusReachableViaWWAN;
    
    if (self.networkState == AFNetworkReachabilityStatusReachableViaWWAN || self.networkState == AFNetworkReachabilityStatusReachableViaWiFi) {
        if (!self.dataArray.count) {
            self.currPage = 1;
        }else{
            self.currPage ++;
        }
        [self getDataWithTableView];
    }else{
        NSLog(@"断网、结束上拉加载或下拉刷新");
        [self haveNoNetwork];
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
    }
}


- (void)checkWebWeatherInter{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (self.networkState = status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                [self haveNoNetwork];
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"不可达的网络(未连接)");
                [self haveNoNetwork];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G、3G、4G网络");
                [self getDataMethod];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                [self getDataMethod];
                break;
            default:
                break;
        }
    }];
    
    [manager startMonitoring];
}


- (void)haveNoNetwork{
    NSLog(@"网络无法连接、子类不需要任何处理");
    SHOWALERT(@"检查网络设置");
    self.isCheckState = YES;
}

- (void)getDataMethod{
    NSLog(@"父类方法getDataMethod");
}
*/
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
