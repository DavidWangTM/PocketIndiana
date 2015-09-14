//
//  ProductDetailsController.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"

@interface ProductDetailsController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *headView;

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *showName;
@property (weak, nonatomic) IBOutlet UILabel *maxNum;
@property (weak, nonatomic) IBOutlet UILabel *addNum;
@property (weak, nonatomic) IBOutlet UILabel *remainNum;
@property (weak, nonatomic) IBOutlet UIView *proView;
@property (weak, nonatomic) IBOutlet UIView *showproView;

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIView *userImageView;
@property (weak, nonatomic) IBOutlet UIButton *userName;
- (IBAction)userOnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *userjoinNum;
- (IBAction)lookuserjoinOnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *userTime;

@property (weak, nonatomic) IBOutlet UILabel *luckyLab;

- (IBAction)luckyOnclick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;

@property (weak, nonatomic) IBOutlet UILabel *pastNum;
@property (weak, nonatomic) IBOutlet UIView *mainproView;
@property (weak, nonatomic) IBOutlet UIView *changeView;
@property (weak, nonatomic) IBOutlet UIView *pacView;

//状态,0为正在抢，1为揭晓，2为揭晓成功
@property NSInteger type_index;
@property (weak, nonatomic) IBOutlet UILabel *countdownLab;
@property (weak, nonatomic) IBOutlet UIView *countdownView;

@property (weak, nonatomic) IBOutlet UIView *topBottomView;

@property (weak, nonatomic) IBOutlet UILabel *bottomLab;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightBtn;

@property (weak, nonatomic) IBOutlet UIButton *bottomLeftBtn;

@end
