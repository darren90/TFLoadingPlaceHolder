//
//  BaseTableViewController.m
//  TFPlaceHolder
//
//  Created by Tengfei on 15/12/29.
//  Copyright © 2015年 ftf. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak)UITableView * tableView;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
    
    [self.view bringSubviewToFront:self.navImage];
}

-(void)initTableView
{
    UITableView * tableView = [[UITableView alloc]init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollEnabled= YES;
    tableView.alwaysBounceVertical = YES;
//    tableView.backgroundColor = [UIColor grayColor];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1,创建cell
    static NSString *ID = @"123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID ];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"text-text:%ld",(long)indexPath.row];
    return cell;
}

 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
