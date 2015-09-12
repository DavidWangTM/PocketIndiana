//
//  BaseViewController.m
//  mjbang_work
//
//  Created by DavidWang on 15/7/24.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"


@interface BaseViewController (){
    UIWebView *phoneCallWebView;
    //定位
    CLLocationManager *_locationManager;
    CLGeocoder *_geocoder;
    BOOL is_show;
    UILabel *titlelab;
}



@end

@implementation BaseViewController

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];

    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    if (ISIOS7LATER) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;//添加手势
    }
    [self isGestureRecognizer:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTopTitle{
    UIView *labview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titlelab = [[UILabel alloc] initWithFrame:labview.frame];
    titlelab.font = [UIFont systemFontOfSize:23];
    titlelab.textAlignment = UIBaselineAdjustmentAlignCenters;
    titlelab.textColor = [UIColor whiteColor];
    [labview addSubview:titlelab];
    self.navigationItem.titleView = labview;
}

-(void)showTitle:(NSString *)name{
    if (titlelab == nil) {
        [self addTopTitle];
    }
    titlelab.text = name;
}

//侧滑手势
-(void)isGestureRecognizer:(BOOL)is{
    //设置左右侧滑功能
    if (ISIOS7LATER) {
        self.navigationController.interactivePopGestureRecognizer.enabled = is;
    }
}

//掩藏导航栏？
-(void)showNavigationBar:(BOOL) is{
    [self.navigationController setNavigationBarHidden:is];
}

//隐藏状态栏？
-(void)showStatusBar:(BOOL)is{
    [[UIApplication sharedApplication] setStatusBarHidden:is];
}

-(void)setIs_show{
    is_show = YES;
}

//退出到登录注册界面
-(void)logoutViewToLoginView {
    
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    UINavigationController * nav = [story instantiateViewControllerWithIdentifier:@"LoginNavigation"];
//    
//    [UIView transitionWithView:appDelegate.window
//                      duration:0.5
//                       options: UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        appDelegate.window.rootViewController = nav;
//                        
//                        //清楚用户信息
//                        USSington * sington = [USSington createInformations];
//                        [sington removeFile];
//                    }
//                    completion:nil];
}

//返回按钮
- (void)onBackAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//压缩图片
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 * 错误信息捕捉
 */
- (BOOL)requestFinish:(NSNumber *)status withMessage:(NSString *)message {

//    if ([status integerValue] == API_STATUS_SUCCESS) {
//        
//        return YES;
//        
//    } else if ([status integerValue] == API_STATUS_UNAUTHORIZED) {
//        [SVProgressHUD showInfoWithStatus:@"您的设备需要重新登录"];
//        //重新登入
//        [self logoutViewToLoginView];
//        return NO;
//        
//    }  else {
//        
//        if ([status integerValue] == API_STATUS_NOBING/* 未绑定手机 */ || [status integerValue] == API_STATUS_UNREGISTER/*未注册*/ || [status integerValue] == API_STATUS_NOGIFT) {
//
//        } else {
//            [SVProgressHUD showErrorWithStatus:message]; 
//            NSLog(@"%@",message);//错误信息提示
//        }
        return NO;
//    }
}

/**
 * 错误信息捕捉
 */
- (BOOL)requestFinish:(NSNumber *)status withMessage:(NSString *)message is_message:(BOOL) is_message{
    
//    if ([status integerValue] == API_STATUS_SUCCESS) {
//        
//        return YES;
//        
//    } else if ([status integerValue] == API_STATUS_UNAUTHORIZED) {
//        [SVProgressHUD showInfoWithStatus:@"您的设备需要重新登录"];
//        //重新登入
//        [self logoutViewToLoginView];
//        return NO;
//        
//    }  else {
//        
//        if ([status integerValue] == API_STATUS_NOBING/* 未绑定手机 */ || [status integerValue] == API_STATUS_UNREGISTER/*未注册*/ || [status integerValue] == API_STATUS_NOGIFT) {
//            
//        } else {
//            if (is_message) {
//                [SVProgressHUD showErrorWithStatus:message];
//            }
//            NSLog(@"%@",message);//错误信息提示
//        }
        return NO;
//    }
}

- (IBAction)backOnclick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)makeACall :(NSString *) phoneNum{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    if (phoneCallWebView != nil) {
        [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    }else{
        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
        [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
        [self.view addSubview:phoneCallWebView];
    }
    
}

-(void)Locationinit{
    //定位管理器
    _locationManager=[CLLocationManager new];
    _geocoder = [CLGeocoder new];
    if (![CLLocationManager locationServicesEnabled]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"定位服务未打开"
                                                       message:@"用户设置中未打开定位或否定了定位,请设置打开"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"跳转修改",nil];
        alert.tag = 888;
        [alert show];
        return;
    }
    //设置代理
    _locationManager.delegate = self;
    //设置定位精度
    _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    //定位频率,每隔多少米定位一次
    CLLocationDistance distance = 500.0;//十米定位一次
    if (ISIOS8LATER) {
        [_locationManager requestAlwaysAuthorization];//ios8使用方法
        [_locationManager requestWhenInUseAuthorization];//使用程序其间允许访问位置数据（iOS8定位需要）
    }
    _locationManager.distanceFilter=distance;
    //启动跟踪定位
    [_locationManager startUpdatingLocation];
    
    if (is_show) {
        [SVProgressHUD showWithStatus:@"正在获取您的签到位置"];
    }
}

#pragma mark - CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//可以通过模拟器设置一个虚拟位置，否则在模拟器中无法调用此方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate = location.coordinate;//位置坐标
    //如果不需要实时定位，使用完即使关闭定位服务
    [self getAddressByLatitude:coordinate.latitude longitude:coordinate.longitude];
    [_locationManager stopUpdatingLocation];
}

#pragma mark 根据坐标取得地名
-(void)getAddressByLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude{
    //反地理编码
    CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks firstObject];
        NSString *city_name = [placemark.addressDictionary objectForKey:@"City"];
        NSString *currentCity = [city_name substringWithRange:NSMakeRange(0, [city_name length] - 1)];
        NSMutableDictionary *newParams = [NSMutableDictionary dictionaryWithDictionary:placemark.addressDictionary];
        [newParams setObject:[NSNumber numberWithDouble:latitude] forKey:@"latitude"];
        [newParams setObject:[NSNumber numberWithDouble:longitude] forKey:@"longitude"];
        [[NSNotificationCenter defaultCenter] postNotificationName:TZ_BACKLOCATION object:newParams userInfo:nil];
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSString *name = [defaults objectForKey:CITY_NAME];
        if (name.length > 0) {
            return ;
        }
        [defaults setObject:currentCity forKey:CITY_NAME];
        [defaults synchronize];
    }];
}

/**
 *定位失败，回调此方法
 */
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if ([error code]==kCLErrorDenied) {
        NSLog(@"访问被拒绝");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"定位失败"
                                                       message:@"用户设置中未打开定位或否定了定位,请设置打开"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"跳转修改",nil];
        [alert show];
    }
    if ([error code]==kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag != 888) {
        return;
    }
    if (buttonIndex == 1) {
        if (ISIOS8LATER) {
            if (&UIApplicationOpenSettingsURLString != NULL) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
        }
    }
}


-(void)dealloc{
    [SVProgressHUD dismiss];
}

@end
