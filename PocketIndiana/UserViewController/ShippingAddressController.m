//
//  ShippingAddressController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/18.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "ShippingAddressController.h"


@interface ShippingAddressController ()

@end

@implementation ShippingAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showTitle:@"收货地址"];
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
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
