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

@end
