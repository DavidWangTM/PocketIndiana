//
//  ProductDetailsController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/14.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "ProductDetailsController.h"
#import "HeadDetailView.h"
#import "ProductDetailsCell.h"
#import "CycleScrollView.h"
#import "MainViewController.h"
#import "DialogManage.h"

@interface ProductDetailsController (){
    BOOL is_select;
    UILabel *numlab;
}

@property (nonatomic , retain) CycleScrollView *mainScorllView;

@end

@implementation ProductDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showTitle:@"奖品详情"];
    [self initView];
    [self AddRight];
    [self ChangeTopView];
    [self AddTapView];
}

-(void)AddTapView{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pacOnclick)];
    [_pacView addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goodssunOnclick)];
    [_goodssunView addGestureRecognizer:tap1];
}

-(void)AddRight{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightOnClick)];
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
    [imageview setImage:[UIImage imageNamed:@"gouwuche_logo"]];
    UIView *lab = [[UIView alloc] initWithFrame:CGRectMake(40,5,20, 20)];
    lab.layer.cornerRadius = 10.0;
    lab.clipsToBounds = YES;
    numlab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    numlab.layer.cornerRadius = 10.0;
    numlab.backgroundColor = [UIColor redColor];
    numlab.textColor = [UIColor whiteColor];
    numlab.font = [UIFont systemFontOfSize:12];
    numlab.textAlignment = UIBaselineAdjustmentAlignCenters;
    numlab.text = @"1";
    [lab addSubview:numlab];
    [right addSubview:imageview];
    [right addSubview:lab];
    [right addGestureRecognizer:tap];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:right];
    
}

-(void)rightOnClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GWC" object:nil];
}


-(void)initView{
    is_select = NO;
    _proView.layer.cornerRadius = 3.0;
    _proView.clipsToBounds = YES;
    _showproView.layer.cornerRadius = 3.0;
    _userImageView.layer.cornerRadius = 25.0;
    _userImageView.clipsToBounds = YES;
    _oneView.layer.cornerRadius = 6.0;
    _twoView.layer.cornerRadius = 6.0;
    [self addHeadViewTop];
    [self setupRefresh];
    [self setFooterData];
}


-(void)addHeadViewTop{
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < 5; ++i) {
        UIImageView *tempimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 173)];
        tempimg.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempimg];
    }
    
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 173) animationDuration:3];
    self.mainScorllView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    
    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    
    self.mainScorllView.totalPagesCount = ^NSInteger(void){
        return 5;
    };
    self.mainScorllView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%ld个",pageIndex);
        
    };
    [_topView addSubview:self.mainScorllView];
}

-(void)ChangeTopView{
    _countdownView.hidden = YES;
    if (_type_index == 1) {
        CGRect frame = _headView.frame;
        frame.size.height -= 48;
        frame.size.height += 14;
        _headView.frame = frame;
        CGRect frame1 = _changeView.frame;
        frame1.size.height -= 48;
        _changeView.frame = frame1;
        _changeView.clipsToBounds = YES;
        CGRect frame2 = _topBottomView.frame;
        frame2.size.height += 14;
        frame2.origin.y -= 14;
        _topBottomView.frame = frame2;
        _countdownView.hidden = NO;
        _bottomLab.hidden = NO;
        _bottomLeftBtn.hidden = YES;
        [_bottomRightBtn setTitle:@"立即前往" forState:UIControlStateNormal];
    }
    if (_type_index == 2) {
        CGRect frame = _headView.frame;
        frame.size.height -= 48;
        _headView.frame = frame;
        CGRect frame1 = _changeView.frame;
        frame1.size.height -= 48;
        _changeView.frame = frame1;
        _changeView.clipsToBounds = YES;
        _countdownView.hidden = NO;
        _bottomLab.hidden = NO;
        _bottomLeftBtn.hidden = YES;
        [_bottomRightBtn setTitle:@"立即前往" forState:UIControlStateNormal];
    }
}

-(void)ReductionView{
    if (_type_index == 1) {
        CGRect frame = _headView.frame;
        frame.size.height += 48;
        frame.size.height -= 14;
        _headView.frame = frame;
        CGRect frame1 = _changeView.frame;
        frame1.size.height += 48;
        _changeView.frame = frame1;
        _changeView.clipsToBounds = YES;
        CGRect frame2 = _topBottomView.frame;
        frame2.size.height -= 14;
        frame2.origin.y += 14;
        _topBottomView.frame = frame2;
        _countdownView.hidden = YES;
        _bottomLab.hidden = YES;
        _bottomLeftBtn.hidden = NO;
        [_bottomRightBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    }else if (_type_index == 2){
        CGRect frame = _headView.frame;
        frame.size.height += 48;
        _headView.frame = frame;
        CGRect frame1 = _changeView.frame;
        frame1.size.height += 48;
        _changeView.frame = frame1;
        _changeView.clipsToBounds = YES;
        _bottomLab.hidden = YES;
        _bottomLeftBtn.hidden = NO;
        [_bottomRightBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    }
}

- (void)setupRefresh
{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.header endRefreshing];
    }];
}

-(void)setFooterData{
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tableView.footer endRefreshing];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Hard coded here for demo purpose
    return 1;
}

//tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (is_select) {
        return 1;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (is_select) {
        return 0.5;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"ProductDetailsCell";
    ProductDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (is_select) {
        cell.hidden = YES;
    }else{
        cell.hidden = NO;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeadDetailView *headview = [[[NSBundle mainBundle] loadNibNamed:@"HeadDetailView" owner:self options:nil] firstObject];
    headview.frame = CGRectMake(0, 0, headview.frame.size.width, headview.frame.size.height);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewOnclick)];
    [headview addGestureRecognizer:tap];
    if (is_select) {
        [UIView animateWithDuration:0.3 animations:^{
            headview.jiantouImage.layer.transform = CATransform3DIdentity;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            headview.jiantouImage.layer.transform = CATransform3DMakeRotation( M_PI_2,0,0,1);
        }];
    }
    
    return headview;
}

-(void)headViewOnclick{
    is_select = !is_select;
    [_tableView reloadData];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

//collecttiondelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (BOUNDS.width - (18*2 + 3 * 10))/4;
    return CGSizeMake(width, width*0.33);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DialogOneCell *cell = (DialogOneCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DialogOneCell" forIndexPath:indexPath];
    
    
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

- (IBAction)userOnclick:(id)sender {
    [self performSegueWithIdentifier:@"userCenter" sender:nil];
}
- (IBAction)lookuserjoinOnclick:(id)sender {
    [DialogManage showDialogOne:self datasorce:self];
}
- (IBAction)detailOnclic:(id)sender {
    
}
- (IBAction)luckyOnclick:(id)sender {
    [self performSegueWithIdentifier:@"calculation" sender:nil];
}

-(void)pacOnclick{
    [self performSegueWithIdentifier:@"pac" sender:nil];
}

-(void)goodssunOnclick{
    [self performSegueWithIdentifier:@"goodssun" sender:nil];
}

@end
