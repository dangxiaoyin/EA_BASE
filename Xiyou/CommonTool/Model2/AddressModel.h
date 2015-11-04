//
//  AddressModel.h
//  Xiyou
//
//  Created by 力波科技 on 15/9/6.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseJSONModel.h"

@interface AddressModel : BaseJSONModel

@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *areaName;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *isDefault;

@property(nonatomic,strong)NSString *areaPath;
@property(nonatomic,strong)NSString *zipCode;
@property(nonatomic,strong)NSString *idnumber;

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *value;

//- (id)initWithDictionary:(NSDictionary *)dic;
@end
