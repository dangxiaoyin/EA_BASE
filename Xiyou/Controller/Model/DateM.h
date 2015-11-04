//
//  DateM.h
//  Xiyou
//
//  Created by  力波科技 on 15/9/7.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateM : NSObject

@property(nonatomic,strong)NSString * xid;
@property(nonatomic,strong)NSString * stname;
@property(nonatomic,strong)NSString * name;

@property(nonatomic,strong)NSString * i;
@property(nonatomic,strong)NSString * proname;
@property(nonatomic,strong)NSString * prosn;
@property(nonatomic,strong)NSString * probrandname;
@property(nonatomic,strong)NSString * checked;
@property(nonatomic,strong)NSString * price;
@property(nonatomic,strong)NSString * level;
@property   int   proquantity;
@property(nonatomic,strong)NSString * image;
@property(nonatomic,strong)NSString * preferentialScale;
@property(nonatomic,strong)NSString * discount;
@property(nonatomic,strong)NSString * totalPrice;
@property(nonatomic,strong)NSString * payid;
@property(nonatomic,strong)NSString * payname;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
