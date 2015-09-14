//
//  TabOneCell.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabOneCell.h"

@implementation TabOneCell

- (void)awakeFromNib {
    // Initialization code
    
    _leftproView.layer.cornerRadius = 3.0;
    _leftproShowView.layer.cornerRadius = 3.0;
    
    _rightContent.layer.cornerRadius = 3.0;
    _rightproShowView.layer.cornerRadius = 3.0;
    
    UITapGestureRecognizer *lefttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftViewOnclick)];
    [_leftView addGestureRecognizer:lefttap];
    
    UITapGestureRecognizer *righttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewOnclick)];
    
    [_rightView addGestureRecognizer:righttap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)leftOnclick:(id)sender {
    [_delegate ShoppingCart:_index*2];
}

- (IBAction)rightOnclick:(id)sender {
    [_delegate ShoppingCart:_index*2 + 1];
}

-(void)leftViewOnclick{
    [_delegate ViewOnClick:_index*2];
}

-(void)rightViewOnclick{
    [_delegate ViewOnClick:_index*2 + 1];
}

@end
