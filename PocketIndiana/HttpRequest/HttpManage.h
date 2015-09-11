//
//  HttpManage.h
//
//  Created by DavidWang on 15/7/23.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCHead.h"

@interface AFConnectionJSONClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;
- (instancetype)init;

@end

@interface AFConnectionAPIClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;
- (instancetype)init;

@end

@interface HttpManage : NSObject






@end
