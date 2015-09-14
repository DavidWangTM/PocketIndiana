//
//  TabThreeViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabThreeViewController.h"
#import "TabThreeCell.h"
#import "ProductDetailsController.h"

@interface TabThreeViewController ()

@end

@implementation TabThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addCollectionViewHeadBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addCollectionViewHeadBottom{
    // 下拉刷新
    _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [_collectionView.header endRefreshing];
    }];
    
    _collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [_collectionView.footer endRefreshing];
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (BOUNDS.width - 2)/2;
    return CGSizeMake(width, width*1.841);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TabThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TabThreeCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
// 选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"detail" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"detail"] == NSOrderedSame ) {
        ProductDetailsController *pdc = (ProductDetailsController*)segue.destinationViewController;
        pdc.type_index = 2;
    }
}


@end
