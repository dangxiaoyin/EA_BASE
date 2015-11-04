//
//  Engine.m
//  Xiyou
//
//  Created by  力波科技 on 15/9/6.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "Engine.h"
#import "AFNetworking.h"
@implementation Engine

static NSString *contentUrl = @"http://api.culigo.com/app/member";
#pragma mark 请求购物车
+(void)ShopCartWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr,NSString * priceStr,BOOL ischeckAll))block ;

{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = @"http://api.culigo.com/app/cart_itemios!list.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             NSMutableArray * priceArr=[responseObject objectForKey:@"message"];
             NSDictionary * priceDict=[priceArr lastObject];
             
             NSString * str=[priceDict objectForKey:@"totalPrice"];
             BOOL ischeckAll=[[priceDict objectForKey:@"ischeckall"] boolValue];
             NSLog(@"str=%@",str);
             
             if ([str intValue]==0&ischeckAll==true)
             {
                 //[CommonTool333 alertWriteWithMsg:@"购物车里暂无宝贝"];
                 block(nil,@"0",ischeckAll);
                 
             }
             else
             {
             HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
             NSMutableArray *messageArr = [[NSMutableArray alloc]init];
             for (int i = 0;i<modele.message.count-1; i++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[modele.message objectAtIndex:i]];
                 [messageArr addObject:dModel];
                 
                 
             }

                 block(messageArr,str,ischeckAll);
             }
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 全选购物车
+(void)AllCheckWithCheck:(NSString *)check WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(BOOL success ,NSString *str))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = @"http://api.culigo.com/app/cart_item!checkall.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"checked":check};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);

             NSString * str=[responseObject objectForKey:@"totalPrice"];
             block(YES,str);
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 选择商品
+(void)ShopCheckWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithComplete:(void(^)( BOOL  success ,NSString * str))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = @"http://api.culigo.com/app/cart_itemios!Check.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             NSDictionary * dict=[responseObject objectForKey:@"message"];
             NSString * str=[dict objectForKey:@"totalPrice"];
             
             
             block(YES,str);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

 
}
#pragma mark 商品增加减少
+(void)ShopAddWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString * )xid WithQuantity:(NSString *)quantity WithComplete:(void(^)( BOOL  success ,NSString * str))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = @"http://api.culigo.com/app/cart_itemios!Edit.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid,@"quantity":quantity};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             
             NSLog(@"%@",operation.responseString);
             
             NSDictionary * dict=[responseObject objectForKey:@"message"];
             NSString * str=[dict objectForKey:@"totalPrice"];
             
             block(YES,str);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 生成订单
+(void)ShopDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr,NSMutableArray * messageArr2,NSMutableArray * messageArr3, NSMutableArray *messageArr4, NSMutableArray *messageArr5))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!info.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             HqyModel * hqyModel=[[HqyModel alloc]initWithDictionary:[responseObject objectForKey:@"message"]];
             NSMutableArray *messageArr =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.productList.count; i ++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[hqyModel.productList objectAtIndex:i]];
                 [messageArr addObject:dModel];
                 
                 
             }
             NSMutableArray *messageArr2 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.storesDeliveryTypesList.count; i ++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[hqyModel.storesDeliveryTypesList objectAtIndex:i]];
                 [messageArr2 addObject:dModel];
                 
             }
             NSMutableArray *messageArr3 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.paymentList.count; i ++)
             {
                 DateM *dModel = [[DateM alloc]initWithDictionary:[hqyModel.paymentList objectAtIndex:i]];
                 [messageArr3 addObject:dModel];
                 
             }
             NSMutableArray *messageArr4 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.storescardsList.count; i ++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[hqyModel.storescardsList objectAtIndex:i]];
                 [messageArr4 addObject:dModel];
                 
             }
             NSMutableArray *messageArr5 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.addressList.count; i ++)
             {
                
                 
                 MineAddModel *model = [[MineAddModel alloc]initWithDictinary:[hqyModel.addressList objectAtIndex:i]];
                 [messageArr5 addObject:model];
                 
             }
           //  NSLog(@"messArr=%@",messageArr);
             block(messageArr,messageArr2,messageArr3,messageArr4,messageArr5);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
   
}
#pragma mark 我的订单
+(void)PersonOrderWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr))block
{
    
    [CommonTool333 loading];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!list.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
             NSMutableArray *messageArr = [[NSMutableArray alloc]init];
             for (int i = 0;i<modele.message.count; i++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[modele.message objectAtIndex:i]];
                 [messageArr addObject:dModel];
                 
             }
             block(messageArr);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
    
}
#pragma mark 各种状态订单
+(void)PersonTerWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr2))block
{
    
    [CommonTool333 loading];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!list.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
             NSMutableArray *messageArr2 = [[NSMutableArray alloc]init];
             for (int i = 0;i<modele.message.count; i++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[modele.message objectAtIndex:i]];
                 [messageArr2 addObject:dModel];
                 
             }
             block(messageArr2);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
    
}

+(void)PersonUerWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr3))block
{
    
    [CommonTool333 loading];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!list.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
             NSMutableArray *messageArr3 = [[NSMutableArray alloc]init];
             for (int i = 0;i<modele.message.count; i++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[modele.message objectAtIndex:i]];
                 [messageArr3 addObject:dModel];
                 
             }
             block(messageArr3);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
    
}
+(void)PersonIerWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr4))block
{
    
    [CommonTool333 loading];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!list.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
             NSMutableArray *messageArr4 = [[NSMutableArray alloc]init];
             for (int i = 0;i<modele.message.count; i++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[modele.message objectAtIndex:i]];
                 [messageArr4 addObject:dModel];
                 
             }
             block(messageArr4);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
    
}

#pragma mark订单详情
+(void)OrderDetailWithXid:(NSString *)xid WithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr))block
{
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!view.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             MessageModel * message=[[MessageModel alloc]initWithDictionary:[responseObject objectForKey:@"message"]];
             NSMutableArray *messageArr =[[NSMutableArray alloc]init];
             [messageArr addObject:message];
             block(messageArr);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

    
    
}
#pragma mark 下级分销商
+(void)LowerWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray * messageArr))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!view.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
//             MessageModel * message=[[MessageModel alloc]initWithDictionary:[responseObject objectForKey:@"message"]];
//             NSMutableArray *messageArr =[[NSMutableArray alloc]init];
//             [messageArr addObject:message];
//             block(messageArr);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 查询签到
+(void)SinginWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSDictionary * dict))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/signios!in.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             NSDictionary *dict=[[NSDictionary alloc]initWithDictionary:responseObject];
             
             block(dict);
         }
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

    
    
}
#pragma mark 执行签到
+(void)QianDaoWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSDictionary * dict))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/signios!reget.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
             NSDictionary *dict=[[NSDictionary alloc]initWithDictionary:responseObject];
             
             block(dict);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

    
    
    
}
#pragma mark 查询抽奖
+(void)FindLuckyWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/draw_recordios.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"item":@"2"};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary *dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}

#pragma mark 微商界面
+(void)ApplyWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/distributionios!put.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         // NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"]) {
             dict=[responseObject objectForKey:@"message"];
             block(dict);

         }
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 绑定手机页面
+(void)MobileBandWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/passwordios!mobileband.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
         dict=[responseObject objectForKey:@"message"];
         block(dict);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 获取绑定手机验证码
+(void)BangDingMobileCodeWithUserName:(NSString *)username WithToken:(NSString *)token WithMobile:(NSString *)mobile WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/passwordios!getMima.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"mobile":mobile};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary *dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 绑定手机
+(void)TieMobileWithUserName:(NSString *)username WithToken:(NSString *)token WithMobile:(NSString *)mobile WithCode:(NSString * )code WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/passwordios!mobilebands.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"mobile":mobile,@"password":code};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 正式申请微商
+(void)ApplyBussinessWithUserName:(NSString *)username WithToken:(NSString *)token WithMobile:(NSString *)mobile WithPhone:(NSString * )phone WithRealname:(NSString *)realname WithIdNumber:(NSString *)idnumber WithBankNmae:(NSString *)bankName WithBankCard:(NSString *)bankCard WithBankMaster:(NSString *)bankMaster WithXid:(NSString * )xid WithComplete:(void(^)(NSMutableDictionary  * dict))block;
{
    NSDictionary *dicc=[[NSDictionary alloc]init];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/distributionios!input.action";
    if ([phone isEqualToString:@""])
    {
        dicc = @{@"username":username,@"token":token,@"mobile":mobile,@"realname":realname,@"idnumber":idnumber,@"bankName":bankName,@"bankCard":bankCard,@"bankMaster":bankMaster,@"id":xid};
    }
    else
    {
        dicc = @{@"username":username,@"token":token,@"mobile":mobile,@"phone":phone,@"realname":realname,@"idnumber":idnumber,@"bankName":bankName,@"bankCard":bankCard,@"bankMaster":bankMaster,@"id":xid};
    }
    //NSLog(@"dicc=%@",dicc);
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         NSMutableDictionary *dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
    
}
#pragma mark 查询关注商品
+(void)findGoodsDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSMutableArray  * messageArr))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/centerios!collect.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
         NSMutableArray *messageArr3 = [[NSMutableArray alloc]init];
         for (int i = 0;i<modele.message.count; i++)
         {
             DateM * dModel = [[DateM alloc]initWithDictionary:[modele.message objectAtIndex:i]];
             [messageArr3 addObject:dModel];
             
         }
         block(messageArr3);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

    
}
#pragma mark 上传图片
+(void)SendAAAWithImage:(NSData *)data WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
        NSString *urlStr = @"http://api.culigo.com/app/imgupload!uploadios.action";
        NSURL *url=[NSURL URLWithString:urlStr];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request addValue:@"multipart/form-data" forHTTPHeaderField:@"Content-type"];
        [request setHTTPBody:data];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (connectionError)
            {
                
            }
            NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"dic=%@",[dic objectForKey:@"message"]);
            
        }];
    
}
#pragma mark 验证优惠券
+(void)TestCardWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithStoreID:(NSString *)storeid WithComplete:(void(^)(NSMutableDictionary * dict))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!checkCard.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid,@"stores_id":storeid};
    
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         NSLog(@"%@",operation.responseString);
         
     }
      failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 西游币转积分
+(void)JifenDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSString  * str))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/depositios!xyb2jf.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);

         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         if ([[dict objectForKey:@"status"] isEqualToString:@"success"])
         {
             float a =[[[dict objectForKey:@"message"]objectForKey:@"depoist"]intValue];
             NSString * st=[NSString stringWithFormat:@"%.2f",a];
             block(st);
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}

#pragma mark 我的积分详情
+(void)MineJifenDetailWithUserName:(NSString *)username WithToken:(NSString *)token WithComplete:(void(^)(NSString  * str))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/memberios!point.action";
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         if ([[dict objectForKey:@"status"] isEqualToString:@"success"])
         {
             int a  =[[[dict objectForKey:@"message"]objectForKey:@"point"]intValue];
             NSString * st=[NSString stringWithFormat:@"%d",a];
             block(st);
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 加入购物车
+(void)InsetrShopCartWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithQuantity:(NSString *)quantity WithComplete:(void(^)(NSDictionary  * str))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/cart_itemios!add.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid,@"quantity":quantity,@"quickbuy":@"false",@"ArrayProp":@""};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
             block(dict);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

    
}
#pragma mark 修改密码
+(void)ChangePswordWithUserName:(NSString *)username WithToken:(NSString *)token WithOldPassword:(NSString *)oldPass WithPassword2:(NSString *)password WithPassword2:(NSString *)password2 WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/passwordios!update.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"oldpassword":oldPass,@"password":password,@"newpassword":password2};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 西游币兑换积分
+(void)ConvertWithUserName:(NSString *)username WithToken:(NSString *)token WithCuligo:(NSString *)culigo WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/depositios!deposit2point.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"deposits":culigo};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 修改支付密码
+(void)ChangePayPasswordWithUserName:(NSString *)username WithToken:(NSString *)token WithOldPassword:(NSString *)oldPass WithPassword2:(NSString *)password WithPassword2:(NSString *)password2 WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/passwordios!updatepaypass.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"oldpassword":oldPass,@"password":password,@"newpassword":password2};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}

#pragma mark 取消关注商品
+(void)DeletaAttentionWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/centerios!delete.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSMutableDictionary * dict=[[NSMutableDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 帮助中心
+(void)PersonHelpWithComplete:(void(^)( NSMutableArray * messageArr))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/articleios!list.action";
    NSDictionary *dicc = @{@"id":@"402881882ba8455f012ba86db8560006"};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
         NSMutableArray *messageArr = [[NSMutableArray alloc]init];
         for (int i = 0;i<modele.message.count-1; i++)
         {
             MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[modele.message objectAtIndex:i]];
             [messageArr addObject:dModel];
             
             
         }
         
         block(messageArr);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 帮助中心详情
+(void)PersonHelpDetailWithXid:(NSString *)xid WithComplete:(void(^)(NSMutableDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/articleios!view.action";
    NSDictionary *dicc = @{@"id":xid};
    [manager GET:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
//         block(messageArr);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

    
}
#pragma mark 获取支付ID
+(void)GetPayIdWithComplete:(void(^)(NSMutableArray  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/depositios!recharge.action";
    [manager POST:requestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         HrjModel * modele=[[HrjModel alloc]initWithDictionary:responseObject];
         NSMutableArray *messageArr = [[NSMutableArray alloc]init];
         for (int i = 0;i<modele.message.count; i++)
         {
             DateM *dModel = [[DateM alloc]initWithDictionary:[modele.message objectAtIndex:i]];
             [messageArr addObject:dModel];
             
             
         }
         
         block(messageArr);
         //         block(messageArr);
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 订单支付界面
+(void)ShopPayVCWithUserName:(NSString *)username WithToken:(NSString *)token WithOrderID:(NSString *)orderID WithComplete:(void(^)(NSMutableDictionary  * dict1,NSMutableDictionary  * dict2,NSMutableDictionary  * dict3))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/paymentios!confirm.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"orderid":orderID};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             NSMutableArray * arr=[responseObject objectForKey:@"message"];
             
             NSMutableDictionary * dict1=arr[0];
             NSMutableDictionary * dict2=arr[1];

             NSMutableDictionary * dict3=arr[2];
             block(dict1,dict2,dict3);

             
         }
         else
         {
             [CommonTool333 alertWriteWithMsg:[responseObject objectForKey:@"message"]];
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 支付
+(void)PayPayWithUserName:(NSString *)username WithToken:(NSString *)token WithOrderID:(NSString *)orderID WithAmountPayable:(NSString *)amountPayable WithIsDeposit:(NSString*)isDeposit WIthPayid:(NSString *)Payid WithPassWord:(NSString *)password WithComplete:(void(^)(NSMutableDictionary  * dict,BOOL isYes))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/paymentios!payment.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"orderid":orderID,@"amountPayable":amountPayable,@"isDeposit":isDeposit,@"password":password,@"id":Payid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
      
         
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             BOOL isYes=YES;
             block(responseObject,isYes);
             
         }
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"warn"])
         {
             BOOL isYes=NO;
             block(responseObject,isYes);

         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];
}
#pragma mark 直接购买
+(void)JustBuyWithUserName:(NSString *)username WithToken:(NSString *)token WithShopID:(NSString *)shopID WithCount:(NSString *)count WithComplete:(void(^)(NSMutableArray * messageArr,NSMutableArray * messageArr2,NSMutableArray * messageArr3, NSMutableArray *messageArr4,int allPrice))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/orderios!info1.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":shopID,@"quantity":count,@"arrayProp":@"",};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             HqyModel * hqyModel=[[HqyModel alloc]initWithDictionary:[responseObject objectForKey:@"message"]];
             NSMutableArray *messageArr =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.productList.count; i ++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[hqyModel.productList objectAtIndex:i]];
                 [messageArr addObject:dModel];
                 
                 
             }
             NSMutableArray *messageArr2 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.storesDeliveryTypesList.count; i ++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[hqyModel.storesDeliveryTypesList objectAtIndex:i]];
                 [messageArr2 addObject:dModel];
                 
             }
             NSMutableArray *messageArr3 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.paymentList.count; i ++)
             {
                 DateM *dModel = [[DateM alloc]initWithDictionary:[hqyModel.paymentList objectAtIndex:i]];
                 [messageArr3 addObject:dModel];
                 
             }
             NSMutableArray *messageArr4 =[[NSMutableArray alloc]init];
             for (int i =0; i <hqyModel.storescardsList.count; i ++)
             {
                 MessageModel *dModel = [[MessageModel alloc]initWithDictionary:[hqyModel.storescardsList objectAtIndex:i]];
                 [messageArr4 addObject:dModel];
                 
             }
             
             //  NSLog(@"messArr=%@",messageArr);
             NSDictionary * diccttt=[[responseObject objectForKey:@"message"]objectForKey:@"productTotalFeeMap"];
             int allPrice=[[diccttt objectForKey:@"totalfee"]intValue];
             block(messageArr,messageArr2,messageArr3,messageArr4,allPrice);
            }
         
         else
         {
             [CommonTool333 alertWriteWithMsg:[responseObject objectForKey:@"message"]];
             
         }
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
#pragma mark 扫码结果
+(void)SelectCodeWithUrl:(NSString *)url WithComplete:(void(^)(NSDictionary  * dict))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/first!sweep.action";
    NSDictionary *dicc = @{@"url":url};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             block([responseObject objectForKey:@"message"]);
         }
         else
         {
             [CommonTool333 alertWriteWithMsg:[responseObject objectForKey:@"message"]];
         }
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"%@",[error localizedDescription]);
             [CommonTool333 alertWriteWithMsg:@"服务器异常"];
             [CommonTool333 hideLoading];
         }];

}
#pragma mark 删除购物车
+(void)ShopCartDeleteWithUserName:(NSString *)username WithToken:(NSString *)token WithXid:(NSString *)xid WithComplete:(void(^)(BOOL isYes))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSString *requestUrl = @"http://api.culigo.com/app/cart_itemios!Delete.action";
    NSDictionary *dicc = @{@"username":username,@"token":token,@"ids":xid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"]isEqualToString:@"success"])
         {
             BOOL isYes=YES;
             block(isYes);
         }
         else
         {
             [CommonTool333 alertWriteWithMsg:[responseObject objectForKey:@"message"]];
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"服务器异常"];
         [CommonTool333 hideLoading];
     }];

}
@end
