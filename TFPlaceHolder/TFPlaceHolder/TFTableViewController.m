//
//  TFTableViewController.m
//  TFPlaceHolder
//
//  Created by Fengtf on 15/12/29.
//  Copyright © 2015年 ftf. All rights reserved.
//

#import "TFTableViewController.h"
#import <MJRefresh.h>
#import <CYLTableViewPlaceHolder.h>
#import "XTNetReloader.h"

@interface TFTableViewController ()<CYLTableViewPlaceHolderDelegate>

@property (nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation TFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setUpMJRefresh];
}


- (void)setUpMJRefresh {
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadNewData {
    if (!self.dataArray.count) {
        self.dataArray = nil;
    } else {
        // 1.添加假数据
        for (int i = 0; i<25; i++) {
            [self.dataArray insertObject:@"" atIndex:0];
        }
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView cyl_reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    });
}


- (UIView *)makePlaceHolderView {
    UIView *taobaoStyle = [self taoBaoStylePlaceHolder];
    return taobaoStyle;
}


- (UIView *)taoBaoStylePlaceHolder {
    __block XTNetReloader *netReloader = [[XTNetReloader alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                                  reloadBlock:^{
                                                                      [self.tableView.mj_header beginRefreshing];
                                                                  }] ;
    return netReloader;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1,创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ];
    }
    //2,设置cell的数据
    cell.textLabel.text = [NSString stringWithFormat:@"数据--：%ld",(long)indexPath.row];
    
    return cell;
}

 -(NSMutableArray *)dataArray
{
    if (_dataArray ) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
