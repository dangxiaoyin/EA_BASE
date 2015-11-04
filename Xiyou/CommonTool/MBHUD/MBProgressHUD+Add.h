//
//  MBProgressHUD+Add.h
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text duration:(NSTimeInterval)time whileExecutingBlock:(dispatch_block_t)block;

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text whileExecutingBlock:(dispatch_block_t)block;

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view detailText:(NSString *)text whileExecutingBlock:(dispatch_block_t)block;

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text textType:(NSString *)type whileExecutingBlock:(dispatch_block_t)block;

+(MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view text:(NSString *)text textType:(NSString *)type duration:(NSTimeInterval)time whileExecutingBlock:(dispatch_block_t)block;
@end
