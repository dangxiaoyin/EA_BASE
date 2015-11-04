//
//  EAFatherViewController.h
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#define IPHONE6_WIDTH               375
#define IPHONE6_HEIGHT              667

#define  MAIN_HEIGHT                  [UIScreen mainScreen].bounds.size.height
#define  MAIN_WIDTH                   [UIScreen mainScreen].bounds.size.width
#define  MAIN_FRAME                   [UIScreen mainScreen].bounds

#define  AF_HTTP_MANAGER              [AFHTTPRequestOperationManager manager]


#import <UIKit/UIKit.h>
#import "EveryDayShareStatusBar.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface EAFatherViewController : UIViewController

@property(nonatomic,strong)EveryDayShareStatusBar *navBar;

@end
