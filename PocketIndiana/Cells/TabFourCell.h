//
//  TabFourCell.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabFourCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showTitle;
@property (weak, nonatomic) IBOutlet UILabel *maxNum;
- (IBAction)lowOnclick:(id)sender;
- (IBAction)addOnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
- (IBAction)delOnclick:(id)sender;

@end
