//
//  CenterThreeCell.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/16.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "CenterThreeCell.h"

@implementation CenterThreeCell

- (void)awakeFromNib {
    // Initialization code
    _cellView.layer.borderWidth = 1.0;
    _cellView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
