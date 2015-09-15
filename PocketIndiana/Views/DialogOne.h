//
//  DialogOne.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/15.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DialogOne : UIView

@property (weak, nonatomic) IBOutlet UILabel *showtitle;
@property (weak, nonatomic) IBOutlet UILabel *NumLab;
@property (weak, nonatomic) IBOutlet UILabel *NumRightLab;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)SureOnclick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *dialogView;
@end
