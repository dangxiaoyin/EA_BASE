//
//  Header.h
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#ifndef EveryDayAttention_Header_h
#define EveryDayAttention_Header_h
#import "User.h"
#import "HttpEngine.h"
#import "HqyModel.h"
#import "NSString+MD5.h"
#import "DesUtil.h"
#import "Des1.h"
#import "Engine.h"
#import "HrjModel.h"
#import "MineAddModel.h"
#import "MessageModel.h"
#import "DateM.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
//#import "AFHTTPRequestOperationManager.h"
#import "AppDelegate.h"
#import "MBProgressHUD+Add.h"
#import "MainModel.h"
#import "AddressModel.h"
#import "UIView+convenience.h"
#import "UIButton+WebCache.h"
#import "CommonTool333.h"
//#import "SDiPhoneVersion.h"
//#import "CustomBtn.h"
#import "UIImage+Common.h"

#define NOTI  [NSNotificationCenter defaultCenter]
#define globalRect [[UIScreen mainScreen] bounds]
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define Notification [NSNotificationCenter defaultCenter]
#define kTabBarHeight 49.0f
#define TarBarHeight 64
#define EdgeDis 8
#define CellEdgeDis 18
#define sectionHeight 10
#define bigTitleFont [UIFont fontWithName:@"STHeitiSC-Light" size:17]
#define secondTitleFont [UIFont fontWithName:@"STHeitiSC-Light" size:16]
#define titleFontSize [UIFont fontWithName:@"STHeitiSC-Light" size:15]
#define FontSize13 [UIFont fontWithName:@"STHeitiSC-Light" size:13]
#define FontSize14 [UIFont fontWithName:@"STHeitiSC-Light" size:14]
#define contentFontSize [UIFont fontWithName:@"STHeitiSC-Light" size:12]
#define minFontSize [UIFont fontWithName:@"STHeitiSC-Light" size:10]

#define MAIN_COLOR [UIColor colorWithRed:232/255.0 green:52/255.0 blue:47/255.0 alpha:1]

#define tabBarCharaterColor [UIColor colorWithRed:128/255.0 green:127/255.0 blue:127/255.0 alpha:1]
#define mainCharaterColor [UIColor colorWithRed:64/255.0 green:64/255.0 blue:64/255.0 alpha:1]
#define BackGroundColor [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define tColor [UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:1]

#define kDefaultTextColor       RGBColor(85,85,85)
#define kDefaultGrayTextColor   RGBColor(173,173,173)

#define trim(str) [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

#define bpadding  20
#define itemPerLine 4
#define kItemW (kScreenW-bpadding*(itemPerLine+1))/itemPerLine
#define kItemH 25

typedef enum{
    topViewClick = 0,
    FromTopToTop = 1,
    FromTopToTopLast = 2,
    FromTopToBottomHead = 3,
    FromBottomToTopLast = 4
} animateType;


#ifdef DEBUG
#define NSLog(...) do {printf("%s[LINE %u]: \n",__func__,__LINE__);NSLog(__VA_ARGS__);} while(0)
#else
#define NSLog(...) do {} while (0)
#endif

#endif
