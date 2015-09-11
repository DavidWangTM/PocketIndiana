//
//  PCHead.h
//  MantleDemo
//
//  Created by DavidWang on 15/7/22.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import <POP/POP.h>
#import "SVProgressHUD.h"
#import <Mantle/Mantle.h>

#define CompressionNum 0.5

//导航栏6.7的高度
#define STATUS_HEIGHT ([[UIDevice currentDevice].systemVersion doubleValue] < 7.0 ? 44.0 : 64.0)

#define ISIOS7LATER [[[UIDevice currentDevice] systemVersion] floatValue]>=7
#define ISIOS8LATER [[[UIDevice currentDevice] systemVersion] floatValue]>=8
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define SCREENWITH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define PHONEBOUND [[UIScreen mainScreen] bounds]
#define BOUNDS [[UIScreen mainScreen] bounds].size
#define IS_PHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_PHONE4   (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define IS_PHONE6   (([[UIScreen mainScreen] bounds].size.height-667)?NO:YES)
#define IS_PHONE6PIS (([[UIScreen mainScreen] bounds].size.height-736)?NO:YES)

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#define IS_SHOW @"is_show"
#define CITY_NAME @"city_name"
#define CITY_KEY @"city_key"
#define TZ_BACKLOCATION @"BACKLOCATION"

#define is_qq ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]])
#define is_wx ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://://"]])
#define is_sina ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibo://"]])

//#define URL @"http://v7.worker.meijiabang.net"

