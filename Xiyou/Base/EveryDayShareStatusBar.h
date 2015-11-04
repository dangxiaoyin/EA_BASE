//
//  EveryDayShareStatusBar.h
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EveryDayShareStatusBar;

@protocol ShareStatusBarDelegate <NSObject>

@optional

-(void)back;
-(void)rightBtnClick:(UIButton *)btn;
-(NSString *)shareStatusBarTitle;

@end

@interface EveryDayShareStatusBar : UIView

@property(nonatomic,weak)id<ShareStatusBarDelegate>delegate;

@property(nonatomic,strong)UIView   *bgView;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UILabel  *titleLabel;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIView   *lineView;

-(void)ShareStatusBarWithTarBarHeight:(CGFloat)navBarHeight;
-(id)initWithFrame:(CGRect)theFrame delegate:(id<ShareStatusBarDelegate>)theDelegate;

@end
