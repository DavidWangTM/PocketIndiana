//
//  BaseViewController.h
//  mjbang_work
//
//  Created by DavidWang on 15/7/24.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCHead.h"
#import "HttpManage.h"
#import <CoreLocation/CoreLocation.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate,CLLocationManagerDelegate>

- (void)isGestureRecognizer:(BOOL)is;
- (void)showNavigationBar:(BOOL) is;
- (void)showStatusBar:(BOOL)is;
- (void)logoutViewToLoginView;
- (void)onBackAction:(id)sender;
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
- (BOOL)requestFinish:(NSNumber *)status withMessage:(NSString *)message is_message:(BOOL) is_message;
- (BOOL)requestFinish:(NSNumber *)status withMessage:(NSString *)message;
//定位
-(void)Locationinit;
- (IBAction)backOnclick:(id)sender;
-(void)makeACall :(NSString *) phoneNum;
-(void)showTitle:(NSString *)name;
-(void)setIs_show;

@end
