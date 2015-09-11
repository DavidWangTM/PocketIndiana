//
//  TabViews.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabDelegate <NSObject>

-(void)OnClickNum:(NSInteger) num;

@end

@interface TabViews : UIView

@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIView *fourView;
@property (weak, nonatomic) IBOutlet UIView *fiveView;

@property (weak, nonatomic) IBOutlet UIImageView *oneImage;
@property (weak, nonatomic) IBOutlet UIImageView *twoImage;
@property (weak, nonatomic) IBOutlet UIImageView *threeImage;
@property (weak, nonatomic) IBOutlet UIImageView *fourImage;
@property (weak, nonatomic) IBOutlet UIImageView *fiveImage;
@property (weak, nonatomic) IBOutlet UILabel *onelab;
@property (weak, nonatomic) IBOutlet UILabel *twolab;
@property (weak, nonatomic) IBOutlet UILabel *threelab;
@property (weak, nonatomic) IBOutlet UILabel *fourlab;
@property (weak, nonatomic) IBOutlet UILabel *fivelab;

@property (weak, nonatomic) id<TabDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end
