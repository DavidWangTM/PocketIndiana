//
//  SunSingleRecordController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/18.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "SunSingleRecordController.h"
#import "CenterThreeCell.h"

@interface SunSingleRecordController ()

@end

@implementation SunSingleRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showTitle:@"晒单记录"];
    [self setupRefresh];
    [self setFooterData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupRefresh
{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_tableView reloadData];
        [self.tableView.header endRefreshing];
    }];
}

-(void)setFooterData{
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tableView.footer endRefreshing];
    }];
}

//tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CenterThreeCell";
    CenterThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
