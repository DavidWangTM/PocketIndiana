//
//  UserCenterViewController.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"

@interface UserCenterViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *userView;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userID;
- (IBAction)oneOnclick:(id)sender;
- (IBAction)twoOnclick:(id)sender;
- (IBAction)threeOnclick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (weak, nonatomic) IBOutlet UIImageView *showTS;


@end
