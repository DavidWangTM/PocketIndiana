//
//  TabOneCell.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabOneCellDelegate <NSObject>

-(void)ShoppingCart:(NSInteger) index;
-(void)ViewOnClick:(NSInteger) index;

@end

@interface TabOneCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *leftContent;
@property (weak, nonatomic) IBOutlet UILabel *leftmaxNum;
@property (weak, nonatomic) IBOutlet UILabel *leftNum;
- (IBAction)leftOnclick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *leftproView;
@property (weak, nonatomic) IBOutlet UIView *leftproShowView;

@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet UILabel *rightContent;
@property (weak, nonatomic) IBOutlet UILabel *rightmaxNum;
@property (weak, nonatomic) IBOutlet UILabel *rightNum;
- (IBAction)rightOnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *rightproView;
@property (weak, nonatomic) IBOutlet UIView *rightproShowView;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@property (weak ,nonatomic) id<TabOneCellDelegate> delegate;
@property NSInteger index;

@end
