//
//  DialogOne.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/15.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "DialogOne.h"

@implementation DialogOne

- (void)awakeFromNib {
    _dialogView.layer.cornerRadius = 5.0;
    _dialogView.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)SureOnclick:(id)sender {
    
}

@end
