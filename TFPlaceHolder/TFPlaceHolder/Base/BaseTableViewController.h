//
//  BaseTableViewController.h
//  TFPlaceHolder
//
//  Created by Tengfei on 15/12/29.
//  Copyright © 2015年 ftf. All rights reserved.
//

#import "BaseViewController.h"
#import "CYLTableViewPlaceHolder.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,CYLTableViewPlaceHolderDelegate>

@property (nonatomic,weak)UITableView * tableView;
@property (nonatomic,strong)NSMutableArray * dataArray;

/**
 *  当前第几页
 */
@property (nonatomic,assign)int currentPage;

/**
 *  YES：首次刷新（上拉刷新），NO：下拉刷新
 */
@property (nonatomic,assign)BOOL isRefreshing;


/**
 *  每次上拉刷新，下拉刷新调用方法
 */
- (void)requestData ;
@end
