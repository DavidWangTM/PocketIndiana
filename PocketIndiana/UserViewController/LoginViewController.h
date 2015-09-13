//
//  LoginViewController.h
//  PocketIndiana
//
//  Created by DavidWang on 15/9/12.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneLab;
@property (weak, nonatomic) IBOutlet UITextField *passwordLab;
- (IBAction)forgetpwOnclick:(id)sender;

- (IBAction)loginOnclick:(id)sender;
- (IBAction)backLogin:(id)sender;
- (IBAction)wxLogin:(id)sender;
- (IBAction)qqLogin:(id)sender;
@end
