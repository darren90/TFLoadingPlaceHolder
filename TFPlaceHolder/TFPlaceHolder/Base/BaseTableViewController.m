//
//  BaseTableViewController.m
//  TFPlaceHolder
//
//  Created by Tengfei on 15/12/29.
//  Copyright © 2015年 ftf. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MJRefresh.h>
#import "XTNetReloader.h"
@interface BaseTableViewController ()


@property (nonatomic,weak)XTNetReloader *netReloader;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
    [self setUpMJRefresh];
    
    self.currentPage = 1;
    self.isRefreshing = YES;

    [self.view bringSubviewToFront:self.navImage];
}

-(void)initTableView
{
    UITableView * tableView = [[UITableView alloc]init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);//self.view.bounds;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollEnabled= YES;
    tableView.alwaysBounceVertical = YES;
//    tableView.backgroundColor = [UIColor grayColor];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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

- (void)setUpMJRefresh {
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.currentPage = 1 ;
        weakSelf.isRefreshing = YES;
        
        [weakSelf loadNewData];
    }];
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.isRefreshing = NO;
        weakSelf.currentPage ++;

        [weakSelf loadNewData];
    }];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}


-(void)loadMoreData
{
//    if (self.dataArray.count) {
//        self.dataArray = nil;
//    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopanimationg];
        // 刷新表格
        [self.tableView cyl_reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
//    });
}

#pragma mark 请求数据

- (void)loadNewData{
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopanimationg];
        // 刷新表格
        [self.tableView cyl_reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
//    });
    
    
    if (self.isRefreshing) {//上拉刷新
        [self.dataArray removeAllObjects];
    }else{
    
    }
    
    [self requestData];
}

-(void)requestData
{
    
}

-(void)stopanimationg
{
    [self.gifImageView stopAnimating];
    [self.gifImageView removeFromSuperview];
}


- (UIView *)makePlaceHolderView {
    UIView *taobaoStyle = [self taoBaoStylePlaceHolder];
    return taobaoStyle;
}


- (UIView *)taoBaoStylePlaceHolder {
    __block XTNetReloader *netReloader = [[XTNetReloader alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                                  reloadBlock:^{
                                                                      [self.tableView.mj_header beginRefreshing];
//                                                                      [self.view addSubview:self.gifImageView];
//                                                                      [self.gifImageView startAnimating];
                                                                  }] ;
    self.netReloader = netReloader;
    netReloader.backgroundColor = [UIColor blueColor];
    NSLog(@"----nodata--");
    return netReloader;
}


-(NSMutableArray *)dataArray
{
    if (!_dataArray ) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
