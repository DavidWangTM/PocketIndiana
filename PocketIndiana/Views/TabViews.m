//
//  TabViews.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabViews.h"

@implementation TabViews

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews{
    [super layoutSubviews];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick_0)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick_1)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick_2)];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick_3)];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick_4)];
    
    [_oneView addGestureRecognizer:tap];
    [_twoView addGestureRecognizer:tap1];
    [_threeView addGestureRecognizer:tap2];
    [_fourView addGestureRecognizer:tap3];
    [_fiveView addGestureRecognizer:tap4];
}

-(void)onclick_0{
    [self selectNum:0];
}

-(void)onclick_1{
    [self selectNum:1];
}

-(void)onclick_2{
    [self selectNum:2];
}

-(void)onclick_3{
    [self selectNum:3];
}

-(void)onclick_4{
    [self selectNum:4];
}

-(void)selectNum:(NSInteger) index{
    for (int i = 0; i < 5; i++) {
        UIView *view = [_mainView viewWithTag:100+i];
        UIImageView *imageview = (UIImageView *)[_mainView viewWithTag:200+i];
        UILabel *label = (UILabel *)[_mainView viewWithTag:300+i];
        if (i == index) {
            [view setBackgroundColor:[[UIColor alloc] initWithRed:157.0/255.0 green:14.0/255.0 blue:24.0/255.0 alpha:1.0]];
            imageview.highlighted = YES;
            label.highlighted = YES;
        }else{
            imageview.highlighted = NO;
            label.highlighted = NO;
            [view setBackgroundColor:[UIColor clearColor]];
        }
    }
    [_delegate OnClickNum:index];
}


@end
