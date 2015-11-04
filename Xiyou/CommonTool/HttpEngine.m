//
//  HttpEngine.m
//  Xiyou
//
//  Created by  力波科技 on 15/8/12.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "HttpEngine.h"
#import "AFNetworking.h"
@implementation HttpEngine

#pragma mark ---获取验证码
+ (void)receiveCodeWithMoble:(NSString *)mobile WithComplete:(void(^)(NSDictionary  *dic))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!getCode.action",contentBaseUrl, methodMember];
    NSDictionary *dicc = @{@"mobile":mobile};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];

}
#pragma mark ---用户名注册
+ (void)registerNameWithUserName:(NSString *)name WithPassWord:(NSString *)password WithReg_pswCon:(NSString *)reg_pswcon  WithComplete:(void(^)(NSDictionary  *dic))block
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!reg.action",contentBaseUrl, methodMember];
    NSDictionary *dicc = @{@"username":name,@"password":password,@"reg_pswCon":reg_pswcon};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         NSDictionary * dict=[[NSDictionary alloc]initWithDictionary:responseObject];
         block(dict);
         
         
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];

}
#pragma mark ---手机注册
+ (void)registerPhoneWithPassWord:(NSString *)password WithValidateMobile:(NSString *)mobile WithReg_pswCon:(NSString *)reg_pswcon WithCode:(NSString *)code WithComplete:(void(^)(NSDictionary  *dic))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!reg.action",contentBaseUrl, methodMember];
    NSDictionary *dicc = @{@"validateMobile":mobile,@"password":password,@"mobilepwd":code,@"reg_pswCon":reg_pswcon};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---用户登录
+(void)loginWithUserName:(NSString *)username withPassword:(NSString *)password withComplete:(void (^)(NSDictionary *))block
{
    NSLog(@"%@",password);
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!login.action",contentBaseUrl,methodMember];
    NSDictionary *dicc = @{@"username":username,@"password":password};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---我的西游
+(void)requestMyWithUserName:(NSString *)username withToken:(NSString *)token withComplete:(void (^)(User *))block
{
    NSLog(@"%@",token);
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!center.action",contentBaseUrl,methodMember];
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             User *auser=[[User alloc]initWithDictionary:[responseObject objectForKey:@"message"]];
             block(auser);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---个人信息 查询
+(void)requestMessageWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(User  *))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!edit.action",contentBaseUrl,methodCenter];
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             User *auser=[[User alloc]initWithDictionary:[responseObject objectForKey:@"message"]];
             block(auser);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---个人信息 编辑
+(void)requestCenterUpdateWithUserName:(NSString*)username withToken:(NSString*)token withNickname:(NSString*)nickname withRealname:(NSString*)realname  withEmail:(NSString*)email withMobile:(NSString*)mobile wighAddress:(NSString*)address withSex:(NSString*)sex withAge:(NSString*)age withComplete:(void(^)(BOOL))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"http://api.culigo.com/app/centerios!update.action"];
    
#warning 接口参数有误
    NSDictionary *dictt = @{@"username":username,@"token":token,@"nickname":nickname,@"realname":realname,@"email":email,@"sex":sex,@"age":age};
    NSLog(@"dic=%@",dictt);
    [manager POST:requestUrl parameters:dictt success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             block(YES);
         }
         else
         {
             block(NO);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"后台异常"];
     }];
}
#pragma mark ---地址管理 地址查询
+(void)requestAddressWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(NSArray *))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!address.action",contentBaseUrl,methodCenter];
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             NSMutableArray *arr=[[NSMutableArray alloc] initWithCapacity:0];
             id message = [responseObject objectForKey:@"message"];
             if (message && [message isKindOfClass:[NSArray class]])
             {
                 for (id address in message)
                 {
                     if (address && [address isKindOfClass:[NSDictionary class]])
                     {
                         AddressModel *model = [[AddressModel alloc] initWithDictionary:address error:nil];
                         [arr addObject:model];
                     }
                 }
                 block(arr);
             }
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---获取省份区域
+(void)requestChildrenAreaWithUserName:(NSString*)username withToken:(NSString*)token withSpecies:(NSString*)species withPath:(NSString*)path withComplete:(void(^)(NSArray  *))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!ChildrenArea.action",contentBaseUrl, methodArea];
    
    NSDictionary *dicc = nil;
    if (path && path.length > 0)
    {
        dicc = @{@"username":username,@"token":token,@"species":species,@"path":path};
    }
    else
    {
        dicc = @{@"username":username,@"token":token,@"species":species};
    }
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
             for (id addressObj in [responseObject objectForKey:@"message"])
             {
                 [arr addObject:addressObj];
             }
             block(arr);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---新增地址页面
+(void)requestAddWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(BOOL  ))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!add.action",contentBaseUrl,methodReceiver];
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             
             block(YES);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}

#pragma mark ---保存编辑地址
+(void)requestUpdateWithUserName:(NSString*)username withToken:(NSString*)token withId:(NSString*)aid withName:(NSString*)name withMobile:(NSString*)mobile withAreaPath:(NSString*)areaPath withAddress:(NSString*)address withZipCode:(NSString*)zipCode withIdnumber:(NSString*)idnumber withIsDefault:(NSString*)isDefault withComplete:(void(^)(BOOL ))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!update.action",contentBaseUrl,methodReceiver];
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":aid,@"name":name,@"mobile":mobile,@"areaPath":areaPath,@"address":address,@"zipCode":zipCode,@"idnumber":idnumber,@"isDefault":isDefault};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             
             block(YES);
         }
     }
        failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}

#pragma mark ---保存新增地址
+(void)requestSaveWithUserName:(NSString*)username withToken:(NSString*)token withName:(NSString*)name withMobile:(NSString*)mobile withAreaPath:(NSString*)areaPath withAddress:(NSString*)address withZipCode:(NSString*)zipCode withIdnumber:(NSString*)idnumber withIsDefault:(NSString*)isDefault withComplete:(void(^)(BOOL  isSuccess))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!save.action",contentBaseUrl,methodReceiver];
    NSDictionary *dicc = @{@"username":username,@"token":token,@"name":name,@"mobile":mobile,@"areaPath":areaPath,@"address":address,@"zipCode":zipCode,@"idnumber":idnumber,@"isDefault":isDefault};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             
             block(YES);
         }
         else
         {
             block(NO);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}

#pragma mark ---删除地址
+(void)requestDeleteWithUserName:(NSString*)username withToken:(NSString*)token withAddressId:(NSString*)aid withComplete:(void(^)(BOOL ))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!delete.action",contentBaseUrl,methodReceiver];
    NSDictionary *dicc = @{@"username":username,@"token":token,@"id":aid};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             block(YES);
         }
         else
         {
             block(NO);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}

#pragma mark ---积分详情
+(void)requestPointWithUserName:(NSString*)username withToken:(NSString*)token withComplete:(void(^)(NSDictionary  *dic))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@!point.action",contentBaseUrl, methodMember];
    NSDictionary *dicc = @{@"username":username,@"token":token};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"success"])
         {
             
             block(responseObject);
         }
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
    
}
#pragma mark ---找回登录密码获取验证码
+ (void)ForggetCodeWithMoble:(NSString *)mobile WithComplete:(void(^)(NSDictionary  *dic))block
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"http://api.culigo.com/app/passwordios!getidentCode.action"];
    NSDictionary *dicc = @{@"mobile":mobile};
    [manager POST:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         
     }];
}
#pragma mark ---找回登录密码
+ (void)ForggetPassWithMoble:(NSString *)mobile WithCode:(NSString*)code WithNewpassWord:(NSString *)password1 WithNewPassword2:(NSString *)password2 WithComplete:(void(^)(NSDictionary  *dic))block;
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"http://api.culigo.com/app/passwordios!updatepass.action"];
    NSDictionary *dicc = @{@"mobile":mobile,@"mobilepwd":code,@"password":password1,@"newpassword":password2};
    [manager GET:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
     }
     
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"后台异常"];
         
     }];

}
#pragma mark---充值
+(void)TopUpWithUserName:(NSString *)userName WithToken:(NSString *)token WithAmount:(NSString *)amount WithPayId:(NSString *)payID WithComplete:(void(^)(NSDictionary  *dic))block;
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSString *requestUrl = [NSString stringWithFormat:@"http://api.culigo.com/app/paymentios!recharge.action"];
    NSDictionary *dicc = @{@"username":userName,@"token":token,@"amountPayable":amount,@"id":payID};
    [manager GET:requestUrl parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",operation.responseString);
         
         
         block(responseObject);
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",[error localizedDescription]);
         [CommonTool333 alertWriteWithMsg:@"后台异常"];
         
     }];
    

}
@end
