//
//  TabFourViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabFourViewController.h"
#import "TabFourCell.h"

@interface TabFourViewController ()

@end

@implementation TabFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"TabFourCell";
    TabFourCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
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

- (IBAction)payOnClick:(id)sender {
    
}



//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
//    [UIView animateWithDuration:0.3 animations:^{
//        _showView.frame = CGRectMake(_showView.frame.origin.x, _showView.frame.origin.y - height - 44, _showView.frame.size.width, _showView.frame.size.height);
//    }];
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
//    [UIView animateWithDuration:0.3 animations:^{
//        _showView.frame = CGRectMake(_showView.frame.origin.x, self.view.frame.size.height, _showView.frame.size.width, _showView.frame.size.height);
//    }];
}



@end
