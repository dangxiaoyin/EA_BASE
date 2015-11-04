//
//  EveryDayShareStatusBar.m
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import "EveryDayShareStatusBar.h"

@implementation EveryDayShareStatusBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)theFrame delegate:(id<ShareStatusBarDelegate>)theDelegate
{
    if (self =[super init])
    {
        self.frame=theFrame;
        self.delegate=theDelegate;
        [self ShareStatusBarWithTarBarHeight:theFrame.size.height];
    }
    return self;
}

-(void)ShareStatusBarWithTarBarHeight:(CGFloat)navBarHeight
{
    self.backgroundColor=[UIColor whiteColor];
    self.bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-0.5)];
    _bgView.backgroundColor=[UIColor whiteColor];
    self.bgView.hidden=YES;
    [self addSubview:_bgView];
    self.backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame=CGRectMake(10, 35, 32, 32);
    [self.backBtn setImage:[UIImage imageNamed:@"my_back"] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backBtn];
    self.backBtn.imageEdgeInsets=UIEdgeInsetsMake(13, 17, 32, 32);
    
    self.titleLabel=[[UILabel alloc]init];
    self.titleLabel.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, navBarHeight/2+10);
    self.titleLabel.bounds=CGRectMake(0, 0, 150, navBarHeight);
    self.titleLabel.text=[self.delegate shareStatusBarTitle];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    self.titleLabel.font=bigTitleFont;
    self.titleLabel.textColor=[UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:1];
    [self addSubview:self.titleLabel];
    
    self.rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.titleLabel.textAlignment=NSTextAlignmentRight;
    self.rightBtn.frame = CGRectMake(kScreenW-54, 20, 44, 44);
    [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font=secondTitleFont;
    [self.rightBtn setTitleColor:RGBColor(109, 109, 109) forState:UIControlStateNormal];
    //[self.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightBtn];
    
    
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, navBarHeight, kScreenW, 0.5)];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];
    
}

-(void)back
{
    [self.delegate back];
}

-(void)rightBtnClick:(UIButton *)btn
{
    [self.delegate rightBtnClick:btn];
}

@end
