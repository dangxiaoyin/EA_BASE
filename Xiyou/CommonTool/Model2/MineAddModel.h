//
//  MineAddModel.h
//  Xiyou
//
//  Created by 胡瑶瑶 on 15/10/13.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineAddModel : NSObject

@property(nonatomic,strong)NSString *xid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *areaName;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *isDefault;

- (id)initWithDictinary:(NSDictionary *)dic;
@end
