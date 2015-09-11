//
//  TabTwoCell.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabTwoCell.h"

@implementation TabTwoCell

- (void)awakeFromNib {
    // Initialization code
    
    _proView.layer.cornerRadius = 3.0;
    _proView.layer.cornerRadius = 3.0;
    
    _showproView.layer.cornerRadius = 3.0;
    _showproView.layer.cornerRadius = 3.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onClick:(id)sender {
}
@end
