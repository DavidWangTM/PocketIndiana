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
}

@end

@implementation TabFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userImageView.layer.cornerRadius = _userImageView.frame.size.width/2;
    
    data = @[@"抢单记录",@"中奖记录",@"晒单记录",@"收货地址",@"物流发放",@"客服咨询"];
    [_collectionView reloadData];
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
}

- (IBAction)registOnclick:(id)sender {
}
@end
