//
//  WelComeViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "WelComeViewController.h"

@interface WelComeViewController ()<WelComeViewsDelegate>{
    WelComeViews *welcomeview;
}

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addViewData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addViewData{
    for (int i = 0 ; i < 4; i++) {
        welcomeview = [[[NSBundle mainBundle] loadNibNamed:@"WelComeViews" owner:self options:nil] firstObject];
        welcomeview.frame = CGRectMake(_scrollView.frame.size.width*i ,_scrollView.frame.origin.y, _scrollView.frame.size.width,_scrollView.frame.size.height);
        welcomeview.index = i;
        welcomeview.delegate = self;
        [_scrollView addSubview:welcomeview];
    }
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * 4,_scrollView.frame.size.height)];
}

-(void)NextOnclick{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"YES" forKey:IS_SHOW];
    [defaults synchronize];
    [self performSegueWithIdentifier:@"main" sender:nil];
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
