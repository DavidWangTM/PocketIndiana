//
//  TabFiveViewController.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"

@interface TabFiveViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *userImageView;
- (IBAction)loginOnclick:(id)sender;
- (IBAction)registOnclick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *userView;
@property (weak, nonatomic) IBOutlet UILabel *userPhone;
@property (weak, nonatomic) IBOutlet UILabel *userMoney;
- (IBAction)rechargeOnclick:(id)sender;


@end
