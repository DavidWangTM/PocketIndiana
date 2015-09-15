//
//  HeadDetailView.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "HeadDetailView.h"

@implementation HeadDetailView


-(void)awakeFromNib{
    _tuView.layer.cornerRadius = 6.0;
    _jiantouImage.layer.transform = CATransform3DMakeRotation( M_PI_2,0,0,1);;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
