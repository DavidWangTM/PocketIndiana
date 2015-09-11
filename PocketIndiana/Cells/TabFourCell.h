//
//  TabFourCell.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourModel.h"

@protocol TabFourCellDelegate <NSObject>

-(void)removeBack:(NSInteger) index;
-(void)RefreshData;

@end

@interface TabFourCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showTitle;
@property (weak, nonatomic) IBOutlet UILabel *maxNum;
- (IBAction)lowOnclick:(id)sender;
- (IBAction)addOnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
- (IBAction)delOnclick:(id)sender;

@property (strong ,nonatomic) FourModel *model;
@property NSInteger index;
@property (weak ,nonatomic) id<TabFourCellDelegate> delegate;

@end
