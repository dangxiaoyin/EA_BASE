//
//  CommonTool.h
//  Running
//
//  Created by libokeji on 15/7/31.
//  Copyright (c) 2015年  力波科技. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CommonTool333 : NSObject
+(NSString *)setTimeWithTime:(NSString*)time;
+ (void)search;
+ (void)sending;
+ (void)loading;
+ (void)loadingWithMsg:(NSString *)msg;
+ (void)hideLoading;
+ (void)alertData;
+ (void)changeImg;
+ (void)alertWriteWithMsg:(NSString *)msg;
//#pragma mark---显示tabBar
//+ (void)showTabBar;
//#pragma mark---隐藏tabBar
//+ (void)hideTabBar;
#pragma mark---去掉tableView上多余的分割线
+ (void)setExtraCellLineHiddenWithTableView:(UITableView *)tableView;
#pragma mark---设置字体之间的间距
+ (void)setSpaceInContentWithContent:(NSString *)contentStr WithLabel:(UILabel *)label;
#pragma mark---设置分割线
+ (void)setSepratorLineWithX:(CGFloat)spaX WithY:(CGFloat)spaY WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithView:(UIImageView *)imgBg;
+ (void)setSepratorLineWithX:(CGFloat)spaX WithY:(CGFloat)spaY WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithScrollView:(UIScrollView *)scroll;
+ (void)setSepratorLineWithX:(CGFloat)spaX WithY:(CGFloat)spaY WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithBgView:(UIView *)View;
#pragma mark---设置自适应行高
+ (CGRect)setTextContentHeightWithContent:(NSString *)content WithWidth:(CGFloat)width WithFontSize:(CGFloat)fontSize;
#pragma mark---计算时间间隔
+ (NSTimeInterval)setTimeIntervalWithEndTime:(NSString *)issueTime;
#pragma mark---点击按钮时切换按钮选择的状态
+ (void)setButtonStateWithCurrentBtn:(UIButton *)currentBtn WithSenderBtn:(UIButton *)sender WithSelectImg:(UIImage *)seleteImg WithCustomImg:(UIImage *)customImg;
+ (BOOL)isEmptyString:(NSString *)sourceStr;
//+ (User *)getUserInfo;
@end
