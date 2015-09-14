//
//  PastAnnouncedController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "PastAnnouncedController.h"
#import "PastAnnouncedCell.h"

@interface PastAnnouncedController ()

@end

@implementation PastAnnouncedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showTitle:@"往期揭晓"];
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
    static NSString *identifier = @"PastAnnouncedCell";
    PastAnnouncedCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
