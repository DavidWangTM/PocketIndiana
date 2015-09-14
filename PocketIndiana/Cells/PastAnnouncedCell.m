//
//  PastAnnouncedCell.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "PastAnnouncedCell.h"

@implementation PastAnnouncedCell

- (void)awakeFromNib {
    // Initialization code
    _userView.layer.cornerRadius = 31.0;
    _userView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
