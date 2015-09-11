//
//  TabFourCell.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabFourCell.h"

@implementation TabFourCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _textfield.text = [NSString stringWithFormat:@"%ld",_model.num];
}

- (IBAction)lowOnclick:(id)sender {
    if (_model.num > 1) {
        _model.num -= 1;
        _textfield.text = [NSString stringWithFormat:@"%ld",_model.num];
        [_delegate RefreshData];
    }
}

- (IBAction)addOnclick:(id)sender {
    _model.num += 1;
    _textfield.text = [NSString stringWithFormat:@"%ld",_model.num];
    [_delegate RefreshData];
}

- (IBAction)delOnclick:(id)sender {
    [_delegate removeBack:_index];
}

@end
