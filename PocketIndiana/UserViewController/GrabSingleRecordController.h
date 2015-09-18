//
//  GrabSingleRecordController.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/18.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"

@interface GrabSingleRecordController : BaseViewController

- (IBAction)oneOnclick:(id)sender;
- (IBAction)twoOnclick:(id)sender;
- (IBAction)threeOnclick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIImageView *showTS;

@end
