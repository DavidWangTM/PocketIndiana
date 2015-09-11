//
//  TabFourViewController.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"

@interface TabFourViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *maxNumLab;
- (IBAction)payOnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
