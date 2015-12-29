//
//  Base_TableViewController.m
//  TFPlaceHolder
//
//  Created by Tengfei on 15/12/29.
//  Copyright © 2015年 ftf. All rights reserved.
//

#import "Base_TableViewController.h"

@interface Base_TableViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation Base_TableViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.gifImageView startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat Main_Screen_Width = [UIScreen mainScreen].bounds.size.width;
    
    self.navImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 20 + 44)];
    self.navImage.backgroundColor = [UIColor grayColor];
    self.navImage.userInteractionEnabled = YES;
    [self.view addSubview:self.navImage];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftBtn setFrame:CGRectMake(0, 20, 44, 44)];
    [self.leftBtn setImage:[UIImage imageNamed:@"nav_btn_back_n"] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"nav_back_me_h"] forState:UIControlStateHighlighted];
    [self.leftBtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.navImage addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setFrame:CGRectMake((Main_Screen_Width - 54), 20, 44, 44)];
    [self.rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.rightBtn setHidden:YES];
    [self.rightBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.navImage addSubview:self.rightBtn];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, (Main_Screen_Width - 160), 44)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.navImage addSubview:self.titleLabel];
    
    self.titleImage = [[UIImageView alloc ]init];
    self.titleImage.center = self.titleLabel.center;
    self.titleImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.navImage addSubview:self.titleImage];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}
-(void)rightBtnClick
{
    
}


-(void)popViewController
{
    
}

- (UIImageView *)gifImageView
{
    if (!_gifImageView) {
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(failReload)];
        _gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _gifImageView.center = self.view.center;
        _gifImageView.bounds = CGRectMake(0, 0, 100, 100);
        
        NSArray *gifArray = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"loading01"],
                             [UIImage imageNamed:@"loading02"],
                             [UIImage imageNamed:@"loading03"],
                             [UIImage imageNamed:@"loading04"],
                             [UIImage imageNamed:@"loading05"],
                             [UIImage imageNamed:@"loading06"],
                             [UIImage imageNamed:@"loading07"],
                             [UIImage imageNamed:@"loading08"],nil];
        _gifImageView.animationImages = gifArray; //动画图片数组
        _gifImageView.animationDuration = 1; //执行一次完整动画所需的时长
        _gifImageView.animationRepeatCount = 0;  //动画重复次数
        _gifImageView.image = [UIImage imageNamed:@"pic_Failedtoload_1"];//(@"pic_Failedtoload_1");
        _gifImageView.userInteractionEnabled = YES;
        [self.view addSubview:_gifImageView];
        [_gifImageView addGestureRecognizer:gesture];
    }
    return _gifImageView;
}

- (UILabel*)reminderLabel
{
    if (!_reminderLabel) {
        CGFloat Main_Screen_Width = [UIScreen mainScreen].bounds.size.width;
        
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(failReload)];
        _reminderLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.gifImageView.frame) + 10, Main_Screen_Width, 20)];
        _reminderLabel.textColor = [UIColor redColor];
        _reminderLabel.font = [UIFont systemFontOfSize:16];
        _reminderLabel.textAlignment = NSTextAlignmentCenter;
        _reminderLabel.text = @"测试一下啊";
        _reminderLabel.userInteractionEnabled = YES;
        [_reminderLabel addGestureRecognizer:gesture];
        [self.view addSubview:_reminderLabel];
    }
    return _reminderLabel;
}

-(void)failReload
{
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
