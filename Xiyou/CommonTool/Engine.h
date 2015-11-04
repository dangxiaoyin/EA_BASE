//
//  Engine.h
//  Xiyou
//
//  Created by  力波科技 on 15/9/6.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject


#pragma mark 请求购物车
+(void)ShopCartWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr,NSString * priceStr,BOOL ischeckAll))block ;
#pragma mark 全选购物车
+(void)AllCheckWithCheck:(NSString *)check WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(BOOL success,NSString *str))block;
#pragma mark 选择商品
+(void)ShopCheckWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithComplete:(void(^)( BOOL  success,NSString * str))block;
#pragma mark 商品增加减少
+(void)ShopAddWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString * )xid WithQuantity:(NSString *)quantity WithComplete:(void(^)( BOOL  success ,NSString * str))block;

#pragma mark 生成订单
+(void)ShopDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr,NSMutableArray * messageArr2,NSMutableArray * messageArr3, NSMutableArray *messageArr4, NSMutableArray *messageArr5))block;
#pragma mark 我的订单
+(void)PersonOrderWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr))block;
#pragma mark 各种状态订单
+(void)PersonTerWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr2))block;
+(void)PersonUerWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr3))block;
+(void)PersonIerWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr4))block;
#pragma mark订单详情
+(void)OrderDetailWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr))block;
#pragma mark 下级分销商
+(void)LowerWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr))block;

#pragma mark 查询签到
+(void)SinginWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSDictionary * dict))block;
#pragma mark 执行签到
+(void)QianDaoWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSDictionary * dict))block;
#pragma mark 查询抽奖
+(void)FindLuckyWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableDictionary  * dict))block;

#pragma mark 微商界面
+(void)ApplyWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 绑定手机页面
+(void)MobileBandWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 获取绑定手机验证码
+(void)BangDingMobileCodeWithUserName:(NSString *)username WithToken:(NSString *)token WithMobile:(NSString *)mobile WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 绑定手机
+(void)TieMobileWithUserName:(NSString *)username WithToken:(NSString *)token WithMobile:(NSString *)mobile WithCode:(NSString * )code WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 正式申请微商
+(void)ApplyBussinessWithUserName:(NSString *)username WithToken:(NSString *)token WithMobile:(NSString *)mobile WithPhone:(NSString * )phone WithRealname:(NSString *)realname WithIdNumber:(NSString *)idnumber WithBankNmae:(NSString *)bankName WithBankCard:(NSString *)bankCard WithBankMaster:(NSString *)bankMaster WithXid:(NSString * )xid WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 查询关注商品
+(void)findGoodsDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray  * messageArr))block;
#pragma mark 上传图片
+(void)SendAAAWithImage:(NSData *)image WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 验证优惠券
+(void)TestCardWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithStoreID:(NSString *)storeid WithComplete:(void(^)(NSMutableDictionary * dict))block;
#pragma mark 西游币转积分
+(void)JifenDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSString  * str))block;

#pragma mark 我的积分详情
+(void)MineJifenDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSString  * str))block;

#pragma mark 加入购物车
+(void)InsetrShopCartWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithQuantity:(NSString *)quantity WithComplete:(void(^)(NSDictionary  * str))block;
#pragma mark 修改密码
+(void)ChangePswordWithUserName:(NSString *)username WithToken:(NSString *)token WithOldPassword:(NSString *)oldPass WithPassword2:(NSString *)password WithPassword2:(NSString *)password2 WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 找回密码
#pragma mark 西游币兑换积分
+(void)ConvertWithUserName:(NSString *)username WithToken:(NSString *)token WithCuligo:(NSString *)culigo WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 修改支付密码
+(void)ChangePayPasswordWithUserName:(NSString *)username WithToken:(NSString *)token WithOldPassword:(NSString *)oldPass WithPassword2:(NSString *)password WithPassword2:(NSString *)password2 WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 取消关注商品
+(void)DeletaAttentionWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 帮助中心
+(void)PersonHelpWithComplete:(void(^)( NSMutableArray *messageArr))block;
#pragma mark 帮助中心详情
+(void)PersonHelpDetailWithXid:(NSString *)xid WithComplete:(void(^)(NSMutableDictionary  * dict))block;
#pragma mark 获取支付ID
+(void)GetPayIdWithComplete:(void(^)(NSMutableArray  * dict))block;
#pragma mark 订单支付界面
+(void)ShopPayVCWithUserName:(NSString *)username WithToken:(NSString *)token WithOrderID:(NSString *)orderID WithComplete:(void(^)(NSMutableDictionary  * dict1,NSMutableDictionary  * dict2,NSMutableDictionary  * dict3))block;
#pragma mark 支付
+(void)PayPayWithUserName:(NSString *)username WithToken:(NSString *)token WithOrderID:(NSString *)orderID WithAmountPayable:(NSString *)amountPayable WithIsDeposit:(NSString*)isDeposit WIthPayid:(NSString *)Payid WithPassWord:(NSString *)password WithComplete:(void(^)(NSMutableDictionary  * dict,BOOL isYes))block;
#pragma mark 直接购买
+(void)JustBuyWithUserName:(NSString *)username WithToken:(NSString *)token WithShopID:(NSString *)shopID WithCount:(NSString *)count WithComplete:(void(^)(NSMutableArray * messageArr,NSMutableArray * messageArr2,NSMutableArray * messageArr3, NSMutableArray *messageArr4,int allPrice))block;
#pragma mark 扫码结果
+(void)SelectCodeWithUrl:(NSString *)url WithComplete:(void(^)(NSDictionary  * dict))block;
#pragma mark 删除购物车
+(void)ShopCartDeleteWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithComplete:(void(^)(BOOL isYes))block;

@end
