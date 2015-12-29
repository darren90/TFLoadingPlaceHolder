//
//  Base_TableViewController.h
//  TFPlaceHolder
//
//  Created by Tengfei on 15/12/29.
//  Copyright © 2015年 ftf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Base_TableViewController : UITableViewController
/**
 *  左边按钮
 */
@property (nonatomic,strong)UIButton * leftBtn;
/**
 *  title
 */
@property (nonatomic,strong)UILabel  * titleLabel;
/**
 *  右边按钮
 */
@property (nonatomic,strong)UIButton * rightBtn;
/**
 *  navbar
 */
@property (nonatomic,strong) UIImageView * navImage;

/**
 *  导航栏标题为图片
 */
@property (nonatomic,strong)UIImageView * titleImage;
/**
 *  父视图
 */
@property (nonatomic,retain)UIViewController * fatherController;
/**
 *  loading动画
 */
@property (nonatomic,strong)UIImageView * gifImageView;
/**
 *  提示label
 */
@property (nonatomic,strong)UILabel * reminderLabel;


@end
