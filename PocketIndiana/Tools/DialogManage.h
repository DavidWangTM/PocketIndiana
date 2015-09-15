//
//  DialogManage.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/15.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DialogOne.h"
#import "DialogOneCell.h"
#import "PCHead.h"

@interface DialogManage : NSObject

+(void)showDialogOne:(id <UICollectionViewDelegate>) delegate datasorce:(id<UICollectionViewDataSource>) datasource;
+(void)didDialogOne;

@end
