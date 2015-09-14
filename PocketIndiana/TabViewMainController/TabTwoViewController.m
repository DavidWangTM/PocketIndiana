//
//  TabTwoViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabTwoViewController.h"
#import "TabTwoCell.h"
#import "TabTwoMenuCell.h"
#import "ProductDetailsController.h"

@interface TabTwoViewController ()

@end

@implementation TabTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupRefresh];
    [self setFooterData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _tableView) {
        return 20;
    }else{
        return 18;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableView) {
        return 88;
    }
    return 45;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableView) {
        static NSString *identifier = @"TabTwoCell";
        TabTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        return cell;
    }else{
        static NSString *identifier = @"TabTwoMenuCell";
        TabTwoMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        return cell;
    }
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView != _tableView) {return;}
    [self performSegueWithIdentifier:@"detail" sender:nil];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"detail"] == NSOrderedSame ) {
        ProductDetailsController *pdc = (ProductDetailsController*)segue.destinationViewController;
        pdc.type_index = 1;
    }
}

@end
