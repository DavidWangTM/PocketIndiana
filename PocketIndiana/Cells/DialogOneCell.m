//
//  DialogOneCell.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/15.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "DialogOneCell.h"

@implementation DialogOneCell

- (void)awakeFromNib {
    // Initialization code
    if (IS_PHONE6) {
        _showLab.font = [UIFont systemFontOfSize:16];
    }else if (IS_PHONE6PIS){
        _showLab.font = [UIFont systemFontOfSize:18];
    }
}

@end
