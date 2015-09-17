//
//  GoodsSunDeatilController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/17.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "GoodsSunDeatilController.h"

@interface GoodsSunDeatilController ()

@end

@implementation GoodsSunDeatilController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showTitle:@"晒单详情"];
    _mainView.layer.borderWidth = 1.0;
    _mainView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    _userView.layer.cornerRadius = 30.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
