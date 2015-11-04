//
//  User.h
//  ForkLift
//
//  Created by 力波科技 on 15/6/3.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property(nonatomic,strong)NSString *xid;
@property(nonatomic,strong)NSString *iscom;
@property(nonatomic,strong)NSString *username;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *memberRankName;

//个人资料
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *realname;
@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *idnumber;
@property(nonatomic,strong)NSString *idcardface;
@property(nonatomic,strong)NSString *idcardback;


@property(nonatomic,strong)NSString *vitalCapacity;
@property(nonatomic,strong)NSString *weight;
@property(nonatomic,strong)NSString *interest;
@property(nonatomic,strong)NSString *nickName;
@property(nonatomic,strong)NSString *background;
@property(nonatomic,strong)NSString *signature;
@property(nonatomic,strong)NSString * orCode;
@property(nonatomic,strong)NSString *remark;
@property(nonatomic,strong)NSString *rname;
@property(nonatomic,strong)NSString *fansCount;

-(id)initWithDictionary:(NSDictionary *)dic;
@end
