//
//  UserCenterViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "UserCenterViewController.h"
#import "CenterOneCell.h"
#import "CenterTwoCell.h"

@interface UserCenterViewController (){
    UILabel *numlab;
    NSInteger type_index;
}

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userView.layer.cornerRadius = 31.0;
    _userView.clipsToBounds = YES;
    
    [self showTitle:@"个人中心"];
    [self AddRight];
    [self setupRefresh];
    [self setFooterData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AddRight{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightOnClick)];
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
    [imageview setImage:[UIImage imageNamed:@"gouwuche_logo"]];
    UIView *lab = [[UIView alloc] initWithFrame:CGRectMake(40,5,20, 20)];
    lab.layer.cornerRadius = 10.0;
    lab.clipsToBounds = YES;
    numlab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    numlab.layer.cornerRadius = 10.0;
    numlab.backgroundColor = [UIColor redColor];
    numlab.textColor = [UIColor whiteColor];
    numlab.font = [UIFont systemFontOfSize:12];
    numlab.textAlignment = UIBaselineAdjustmentAlignCenters;
    numlab.text = @"1";
    [lab addSubview:numlab];
    [right addSubview:imageview];
    [right addSubview:lab];
    [right addGestureRecognizer:tap];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:right];
    
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

-(void)rightOnClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GWC" object:nil];
}

//tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (type_index == 2) {
        return 0;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (type_index == 0) {
        return 145;
    }else if (type_index == 1 || type_index == 2){
        return 130;
    }
    return 145;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (type_index == 0) {
        static NSString *identifier = @"CenterOneCell";
        CenterOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        return cell;
    }else if (type_index == 1 || type_index == 2) {
        static NSString *identifier = @"CenterTwoCell";
        CenterTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        return cell;
    }
    
    return nil;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)oneOnclick:(id)sender {
    [self moveLine:0];
    _showTS.hidden = YES;
}

- (IBAction)twoOnclick:(id)sender {
    [self moveLine:1];
    _showTS.hidden = YES;
}

- (IBAction)threeOnclick:(id)sender {
    [self moveLine:2];
    _showTS.hidden = NO;
}


-(void)moveLine:(NSInteger) index{
    type_index = index;
    CGFloat width = BOUNDS.width/3;
    [UIView animateWithDuration:0.3 animations:^{
        _lineView.frame = CGRectMake(width*index, _lineView.frame.origin.y, _lineView.frame.size.width, _lineView.frame.size.height);
    }];
    [_tableView.header beginRefreshing];
}

@end
