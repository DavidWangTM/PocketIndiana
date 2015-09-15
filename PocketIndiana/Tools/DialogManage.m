//
//  DialogManage.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/15.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "DialogManage.h"

@implementation DialogManage

+(void)showDialogOne:(id <UICollectionViewDelegate>) delegate datasorce:(id<UICollectionViewDataSource>) datasource{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CancelOnclick)];
    DialogOne *dialog = [[[NSBundle mainBundle] loadNibNamed:@"DialogOne" owner:self options:nil] firstObject];
    [dialog addGestureRecognizer:tap];
    dialog.tag = 188;
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([DialogOneCell class]) bundle:nil];
    [dialog.collectionView registerNib:nib forCellWithReuseIdentifier:@"DialogOneCell"];
    dialog.collectionView.delegate = delegate;
    dialog.collectionView.dataSource = datasource;
    dialog.frame = CGRectMake(0,0, SCREENWITH, SCREENHEIGHT);
    [dialog.collectionView reloadData];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *mainview = window.subviews[0];
    [mainview addSubview:dialog];
    [UIView animateWithDuration:0.3 animations:^{
        dialog.alpha = 1.0;
    }];
}

+(void)didDialogOne{
    [self CancelOnclick];
}

+(void)CancelOnclick{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *mainview = window.subviews[0];
    DialogOne *dialog = (DialogOne *)[mainview viewWithTag:188];
    [UIView animateWithDuration:0.3 animations:^{
        dialog.alpha = 0.0;
    } completion:^(BOOL finished) {
        [dialog removeFromSuperview];
    }];
}

@end
