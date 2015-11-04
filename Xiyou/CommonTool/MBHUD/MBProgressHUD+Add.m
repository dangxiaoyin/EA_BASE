//
//  MBProgressHUD+Add.m
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.5];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.labelFont = [UIFont fontWithName:@"STHeitiSC-Light" size:12];

    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    return hud;
}

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text whileExecutingBlock:(dispatch_block_t)block
{
   return  [self showHUDAddedTo:view text:text duration:1.7 whileExecutingBlock:block];
}


+(instancetype)showHUDAddedTo:(UIView *)view text:(NSString *)text duration:(NSTimeInterval)time whileExecutingBlock:(dispatch_block_t)block
{
    
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.labelFont = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:NO whileExecutingBlock:^{
        sleep(time);
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            if (block) {
                block();
            }
        });
    }];
    [view addSubview:hud];
    return hud;
}


+(instancetype)showHUDAddedTo:(UIView *)view detailText:(NSString *)text whileExecutingBlock:(dispatch_block_t)block
{
    return  [self showHUDAddedTo:view text:text textType:nil whileExecutingBlock:block];
}


+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text textType:(NSString *)type whileExecutingBlock:(dispatch_block_t)block
{
    return [self showHUDAddedTo:view text:text textType:nil duration:2.0 whileExecutingBlock:block];
}

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text textType:(NSString *)type duration:(NSTimeInterval)time whileExecutingBlock:(dispatch_block_t)block
{
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:NO whileExecutingBlock:^{
        sleep(time);
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            if (block) {
                block();
            }
        });
    }];
    [view addSubview:hud];
    return hud;
}


@end
