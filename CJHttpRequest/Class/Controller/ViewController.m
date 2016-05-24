//
//  ViewController.m
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/9.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "ViewController.h"
#import "CJHospital.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSuperViewFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self addMJRefreshHeader:YES addFooter:YES];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
}

- (void)getDataWithTableView{
    NSLog(@"子类正在重写父类getDataWithTableView方法");
    
    NSString *webString = @"http://101.231.75.25:8080/jkms-app-test/higherHealth/testPackageView.do";
    
    NSDictionary *parameters = @{@"page":[NSString stringWithFormat:@"%ld",self.currPage],@"rows":PAGESIZESTRING};
    
    [CJHttpRequest POSTwithUrl:webString parameters:parameters success:^(id responseObject) {
        NSLog(@"数据刷新success");
        NSArray *array = [CJHospital mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"msg"][@"rows"]];
        for (CJHospital *hospital in array) {
//            NSLog(@"rows:%@",hospital.hosName);
            [self.dataArray addObject:hospital];
        }
        [self.tableView reloadData];
        
        if (array.count < PAGESIZE) {
            [self.tableView.footer noticeNoMoreData];
        }else{
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"数据刷新failure");
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
    }];
    
}

#pragma mark -
#pragma mark - UITableViewDataSource
//默认可以不需要重写、根据需求可以重写即可
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (self.dataArray.count) {
        CJHospital *hospital = self.dataArray[indexPath.row];
        cell.textLabel.text = hospital.hosName;
    }
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath.row:%ld",indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
