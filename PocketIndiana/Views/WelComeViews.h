//
//  WelComeViews.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WelComeViewsDelegate <NSObject>

-(void)NextOnclick;

@end

@interface WelComeViews : UIView
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property NSInteger index;
@property (weak ,nonatomic) id<WelComeViewsDelegate> delegate;

@end
