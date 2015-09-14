//
//  TabFourViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabFourViewController.h"
#import "TabFourCell.h"
#import "FourModel.h"
#import "MainViewController.h"

@interface TabFourViewController ()<UITextFieldDelegate,TabFourCellDelegate>{
    NSMutableArray *data;
    NSInteger maxnum;
    CGFloat mr_y;
}

@end

@implementation TabFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [NSMutableArray new];
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
    [self initData];
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%f",self.view.frame.origin.y);
}

-(void)initData{
    for (int i = 0; i<10 ; i++) {
        FourModel *model = [FourModel new];
        model.num = 10 + i;
        [data addObject:model];
    }
    [_tableView reloadData];
    [self RefreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"TabFourCell";
    TabFourCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textfield.delegate = self;
    cell.textfield.tag = 100 + indexPath.row;
    FourModel *model = [data objectAtIndex:indexPath.row];
    cell.model = model;
    cell.index = indexPath.row;
    cell.delegate = self;
        
    return cell;
    
}

-(void)removeBack:(NSInteger)index{
    [data removeObjectAtIndex:index];
    [_tableView reloadData];
    [self RefreshData];
}

-(void)RefreshData{
    maxnum = 0;
    for (FourModel *info in  data) {
        maxnum += info.num;
    }
    _maxNumLab.text = [NSString stringWithFormat:@"￥%ld",maxnum];
    if (maxnum > 0) {
        _payView.hidden = NO;
        _bgView.hidden = YES;
    }else{
        _payView.hidden = YES;
        _bgView.hidden = NO;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


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
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x, _bottomView.frame.origin.y - height - _bottomView.frame.size.height, _bottomView.frame.size.width, _bottomView.frame.size.height);
    }];
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x, self.view.frame.size.height, _bottomView.frame.size.width, _bottomView.frame.size.height);
    }];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSInteger index = textField.tag - 100;
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [_tableView scrollToRowAtIndexPath:scrollIndexPath
                      atScrollPosition:UITableViewScrollPositionTop animated:YES];
    if (index == data.count - 1) {
        mr_y =_tableView.contentOffset.y;
        [_tableView setContentOffset:CGPointMake(0,(index - 1)*170) animated:YES];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger index = textField.tag - 100;
    FourModel *info = [data objectAtIndex:index];
    NSInteger num = [textField.text integerValue];
    info.num = num;
    textField.text = [NSString stringWithFormat:@"%ld",num];
    if (index == data.count - 1) {
        [_tableView setContentOffset:CGPointMake(0,mr_y) animated:YES];
    }
    [self RefreshData];
}


- (IBAction)editsureOnclick:(id)sender {
    [self.view endEditing:NO];
}

- (IBAction)moveOnclick:(id)sender {
    MainViewController *main = (MainViewController *)self.tabBarController;
    [main MainselectNum:0];
}

@end
