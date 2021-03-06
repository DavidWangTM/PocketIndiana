//
//  MainViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "MainViewController.h"
#import "TabViews.h"


@interface MainViewController ()<TabDelegate>{
    TabViews *tabview;
    UIBarButtonItem *left;
    UIBarButtonItem *right;
    UIBarButtonItem *right_five;
    UILabel *titlelab;
    UIView *labview;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    tabview = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TabViews class]) owner:nil options:nil] lastObject];
    tabview.frame = rect;
    tabview.delegate = self;
    [self.view addSubview:tabview];
    UIColor *color = [[UIColor alloc] initWithRed:14.0/255.0 green:14.0/255.0 blue:14.0/255.0 alpha:1.0];
    if (ISIOS7LATER){
        [self.navigationController.navigationBar setBarTintColor:color];
    }else{
        [self.navigationController.navigationBar setTintColor:color];
    }
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(-10, 0, 98, 24)];
    UIImageView *image = [[UIImageView alloc] initWithFrame:leftview.frame];
    image.image = [UIImage imageNamed:@"hometitle"];
    [leftview addSubview:image];
    left = [[UIBarButtonItem alloc] initWithCustomView:leftview];
    
    UIView *righttview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 72, 24)];
    UIButton *rightbtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 72, 24)];
    [rightbtn addTarget:self action:@selector(gonggaoOnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightbtn setImage:[UIImage imageNamed:@"gonggao"] forState:UIControlStateNormal];
    [rightbtn setImage:[UIImage imageNamed:@"gonggao_s"] forState:UIControlStateHighlighted];
    [righttview addSubview:rightbtn];
    right = [[UIBarButtonItem alloc] initWithCustomView:righttview];
    
    UIButton *fivebtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [fivebtn setTitle:@"更多" forState:UIControlStateNormal];
    fivebtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [fivebtn addTarget:self action:@selector(moreOnclick) forControlEvents:UIControlEventTouchUpInside];
    right_five = [[UIBarButtonItem alloc] initWithCustomView:fivebtn];
    
    labview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titlelab = [[UILabel alloc] initWithFrame:labview.frame];
    titlelab.font = [UIFont systemFontOfSize:23];
    titlelab.textAlignment = UIBaselineAdjustmentAlignCenters;
    titlelab.textColor = [UIColor whiteColor];
    [labview addSubview:titlelab];
    [self OnClickNum:0];
    [self addNSNotification];
    
    self.tabBarItem.badgeValue = @"10";
}

-(void)addNSNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callBack) name:@"GWC" object:nil];
}

-(void)callBack{
    [self MainselectNum:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)MainselectNum:(NSInteger)num{
    [tabview selectNum:num];
}

-(void)OnClickNum:(NSInteger)num{
    self.navigationItem.leftBarButtonItem =  nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.titleView = nil;
    if (num == 0) {
        self.title = @"口袋夺宝";
        titlelab.text = @"";
        self.navigationItem.leftBarButtonItem =  left;
        self.navigationItem.rightBarButtonItem = right;
        self.navigationItem.titleView = labview;
    }else if(num == 1){
        titlelab.text = @"全部商品";
        self.navigationItem.titleView = labview;
    }else if (num == 2){
        titlelab.text = @"最新揭晓";
        self.navigationItem.titleView = labview;
    }else if (num == 3){
        titlelab.text = @"购物车";
        self.navigationItem.titleView = labview;
    }else if (num == 4){
        titlelab.text = @"个人中心";
        self.navigationItem.titleView = labview;
        self.navigationItem.rightBarButtonItem = right_five;
    }
    self.selectedIndex = num;
    if (num == 0) {
        return;
    }
    self.title = titlelab.text;
}

-(void)gonggaoOnClick{
    
}

-(void)moreOnclick{
    [self performSegueWithIdentifier:@"more" sender:nil];
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
