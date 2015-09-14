//
//  TabOneViewController.m
//  PocketIndiana
//
//  Created by DavidWang on 15/9/11.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TabOneViewController.h"
#import "TabOneCell.h"
#import "CycleScrollView.h"
#import "ProductDetailsController.h"

@interface TabOneViewController ()<TabOneCellDelegate>{
    
}

@property (nonatomic , retain) CycleScrollView *mainScorllView;

@end



@implementation TabOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addHeadViewTop];
    [self setupRefresh];
    [self addOnclick];
}

-(void)addOnclick{
    for (int i = 150; i < 154; i++) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapOnclcik:)];
        UIView *uiview = [self.view viewWithTag:i];
        [uiview addGestureRecognizer:tap];
    }
}


-(void)TapOnclcik:(UITapGestureRecognizer*)recognizer{
     NSInteger num = recognizer.view.tag;
    NSLog(@"%ld",num);
    if (num == 150) {
        return;
    }
    [self performSegueWithIdentifier:@"detail" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupRefresh
{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.header endRefreshing];
    }];
}

-(void)addHeadViewTop{
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < 5; ++i) {
        UIImageView *tempimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 115)];
        tempimg.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempimg];
    }
    
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 115) animationDuration:3];
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
    [self.HeadView addSubview:self.mainScorllView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 260;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"TabOneCell";
    TabOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.delegate = self;
    cell.index = indexPath.row;
    return cell;
}


/**
 *  delegate
 *  @param index _index;
 */
-(void)ShoppingCart:(NSInteger)index{
    
}
-(void)ViewOnClick:(NSInteger)index{
    [self performSegueWithIdentifier:@"detail" sender:nil];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"detail"] == NSOrderedSame ) {
        ProductDetailsController *pdc = (ProductDetailsController*)segue.destinationViewController;
        pdc.type_index = 0;
    }
}


- (IBAction)moreOnclick:(id)sender {
}
@end
