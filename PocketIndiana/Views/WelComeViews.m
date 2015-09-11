//
//  WelComeViews.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "WelComeViews.h"

@implementation WelComeViews

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromFetch
{
//    _showImage.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick)];
    switch (_index) {
        case 0:
            [_showImage setImage:[UIImage imageNamed:@"start1"]];
            break;
        case 1:
            [_showImage setImage:[UIImage imageNamed:@"start2"]];
            break;
        case 2:
            [_showImage setImage:[UIImage imageNamed:@"start3"]];
            break;
        case 3:
            [_showImage setImage:[UIImage imageNamed:@"start4"]];
            [_showImage addGestureRecognizer:tap];
            break;
        default:
            break;
    }
}

-(void)onclick{
    [_delegate NextOnclick];
}

@end
