//
//  HttpEngine.h
//  Xiyou
//
//  Created by  力波科技 on 15/8/12.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

//static const NSString *contentBaseUrl = @"http://192.168.1.105/xiyou/app/";
//static const NSString *contentBaseUrl = @"http://api.culigo.com/app/";
static const NSString *contentBaseUrl = @"http://api.culigo.com/app/";
static const NSString *methodMember =  @"memberios";
static const NSString *methodCenter =  @"centerios";
static const NSString *methodArea =  @"areaios";
static const NSString *methodReceiver =  @"receiverios";
static const NSString *methodOrder =  @"orderios";

@class User,AddressModel;
@interface HttpEngine : NSObject

#pragma mark ---获取验证码
+ (void)receiveCodeWithMoble:(NSString *)mobile WithComplete:(void(^)(NSDictionary  *dic))block;
#pragma mark ---用户名注册
+ (void)registerNameWithUserName:(NSString *)name WithPassWord:(NSString *)password WithReg_pswCon:(NSString *)reg_pswcon  WithComplete:(void(^)(NSDictionary  *dic))block;
#pragma mark ---手机注册
+ (void)registerPhoneWithPassWord:(NSString *)password WithValidateMobile:(NSString *)mobile WithReg_pswCon:(NSString *)reg_pswcon WithCode:(NSString *)code WithComplete:(void(^)(NSDictionary  *dic))block;

#pragma mark ---用户登录
+(void)loginWithUserName:(NSString*)username withPassword:(NSString*)password withComplete:(void(^)(NSDictionary  *dic))block;
#pragma mark ---我的西游
+(void)requestMyWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(User  *aUser))block;
#pragma mark ---个人信息 查询
+(void)requestMessageWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(User  *aUser))block;
#pragma mark ---个人信息 编辑
+(void)requestCenterUpdateWithUserName:(NSString*)username withToken:(NSString*)token withNickname:(NSString*)nickname withRealname:(NSString*)realname  withEmail:(NSString*)email withMobile:(NSString*)mobile wighAddress:(NSString*)address withSex:(NSString*)sex withAge:(NSString*)age withComplete:(void(^)(BOOL))block;
#pragma mark ---地址管理 地址查询
+(void)requestAddressWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(NSArray *lists))block;

#pragma mark ---获取省份区域
+(void)requestChildrenAreaWithUserName:(NSString*)username withToken:(NSString*)token withSpecies:(NSString*)species withPath:(NSString*)path withComplete:(void(^)(NSArray  *lists))block;
#pragma mark ---新增地址页面
+(void)requestAddWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(BOOL  isSuccess))block;
#pragma mark ---保存编辑地址
+(void)requestUpdateWithUserName:(NSString*)username withToken:(NSString*)token withId:(NSString*)aid withName:(NSString*)name withMobile:(NSString*)mobile withAreaPath:(NSString*)areaPath withAddress:(NSString*)address withZipCode:(NSString*)zipCode withIdnumber:(NSString*)idnumber withIsDefault:(NSString*)isDefault withComplete:(void(^)(BOOL ))block;
#pragma mark ---保存新增地址
+(void)requestSaveWithUserName:(NSString*)username withToken:(NSString*)token withName:(NSString*)name withMobile:(NSString*)mobile withAreaPath:(NSString*)areaPath withAddress:(NSString*)address withZipCode:(NSString*)zipCode withIdnumber:(NSString*)idnumber withIsDefault:(NSString*)isDefault withComplete:(void(^)(BOOL  isSuccess))block;
#pragma mark ---删除地址
+(void)requestDeleteWithUserName:(NSString*)username withToken:(NSString*)token withAddressId:(NSString*)aid withComplete:(void(^)(BOOL ))block;
#pragma mark ---积分详情
+(void)requestPointWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(NSDictionary  *dic))block;
#pragma mark ---找回登录密码获取验证码
+ (void)ForggetCodeWithMoble:(NSString *)mobile WithComplete:(void(^)(NSDictionary  *dic))block;
#pragma mark ---找回登录密码
+ (void)ForggetPassWithMoble:(NSString *)mobile WithCode:(NSString*)code WithNewpassWord:(NSString *)password1 WithNewPassword2:(NSString *)password2 WithComplete:(void(^)(NSDictionary  *dic))block;
#pragma mark---充值
+(void)TopUpWithUserName:(NSString *)userName WithToken:(NSString *)token WithAmount:(NSString *)amount WithPayId:(NSString *)payID WithComplete:(void(^)(NSDictionary  *dic))block;
@end
