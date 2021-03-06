//
//  TabFiveViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabFiveViewController.h"
#import "TabFiveCell.h"

@interface TabFiveViewController (){
    NSArray *data;
    NSArray *seguedata;
    BOOL is_login;
}

@end

@implementation TabFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    // Do any additional setup after loading the view.
    _userImageView.layer.cornerRadius = _userImageView.frame.size.width/2;

    [self ChangeUserData];
    
    [_collectionView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:USER_INFO] != nil) {
        [self ChangeUserData];
    }else{
        data = @[@"抢单记录",@"中奖记录",@"晒单记录",@"收货地址",@"物流发放",@"客服咨询"];
        _userView.hidden = YES;
        _loginView.hidden = NO;
    }
    [_collectionView reloadData];
}

-(void)ChangeUserData{
    data = @[@"抢单记录",@"中奖记录",@"晒单记录",@"充值记录",@"推广",@"收货地址",@"物流发放",@"客服咨询",@"意见反馈"];
    seguedata = @[@"grabsingle",@"winning",@"sunsingle",@"recharge",@"spread",@"shippingaddress",@"",@"",@""];
    _userView.hidden = NO;
    _loginView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [data count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (BOUNDS.width - 4)/3;
    return CGSizeMake(width, width);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TabFiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TabFiveCell" forIndexPath:indexPath];
    NSString *title = [data objectAtIndex:indexPath.row];
    cell.showTitle.text = title;
    cell.showImage.image = [UIImage imageNamed:title];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
// 选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (!_loginView.hidden) {
        [self performSegueWithIdentifier:@"login" sender:nil];
        return;
    }
    NSInteger index = indexPath.row;
    [self performSegueWithIdentifier:[seguedata objectAtIndex:index] sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginOnclick:(id)sender {
    [self performSegueWithIdentifier:@"login" sender:nil];
}

- (IBAction)registOnclick:(id)sender {
    [self performSegueWithIdentifier:@"regist" sender:nil];
}

- (IBAction)rechargeOnclick:(id)sender {
    
}
@end
