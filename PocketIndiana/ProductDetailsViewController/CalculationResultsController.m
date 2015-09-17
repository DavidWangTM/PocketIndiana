//
//  CalculationResultsController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/17.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "CalculationResultsController.h"
#import "CalculationOneCell.h"
#import "CalculationTwoCell.h"
#import "CalculationThreeCell.h"

@interface CalculationResultsController ()

@end

@implementation CalculationResultsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showTitle:@"计算结果"];
    [self addRightView];
}

-(void)addRightView{
    UIButton *fivebtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 12, 60, 20)];
    [fivebtn setTitle:@"计算方式" forState:UIControlStateNormal];
    fivebtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [fivebtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [fivebtn setBackgroundColor:[UIColor whiteColor]];
    fivebtn.layer.cornerRadius = 5.0;
    [fivebtn addTarget:self action:@selector(moreOnclick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right_five = [[UIBarButtonItem alloc] initWithCustomView:fivebtn];
    self.navigationItem.rightBarButtonItem = right_five;
}

-(void)moreOnclick{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 62;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger num = indexPath.row;
    if (num < 5) {
        return 40;
    }else if (num == 5){
        return 140;
    }else if (num > 5 && num < 57){
        return 40;
    }else if (num == 57){
        return 50;
    }
    return 40;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger num = indexPath.row;
    if (num < 5) {
        static NSString *identifier = @"CalculationOneCell";
        CalculationOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.oneLine.hidden = YES;
        cell.twoLine.hidden = YES;
        cell.imageLine.hidden = YES;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else if (num == 5){
        static NSString *identifier = @"CalculationTwoCell";
        CalculationTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        return cell;
    }else if (num > 5 && num < 57){
        static NSString *identifier = @"CalculationOneCell";
        CalculationOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.oneLine.hidden = NO;
        cell.twoLine.hidden = NO;
        cell.imageLine.hidden = NO;
        
        cell.backgroundColor = [[UIColor alloc] initWithRed:249.0/255.0 green:232.0/255.0 blue:180.0/255.0 alpha:1.0];
        return cell;
    }else if (num == 57){
        static NSString *identifier = @"CalculationThreeCell";
        CalculationThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        return cell;
    }else{
        static NSString *identifier = @"CalculationOneCell";
        CalculationOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.oneLine.hidden = YES;
        cell.twoLine.hidden = YES;
        cell.imageLine.hidden = YES;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    
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
