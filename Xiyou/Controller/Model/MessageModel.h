//
//  MessageModel.h
//  Xiyou
//
//  Created by  力波科技 on 15/9/7.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject


@property(nonatomic,strong)NSArray * productList;
@property(nonatomic,strong)NSString * stname;
@property(nonatomic,strong)NSString * storeid;
@property(nonatomic,strong)NSString * image;

@property(nonatomic,strong)NSString * title;

@property(nonatomic,strong)NSString * orderid;
@property(nonatomic,strong)NSString * orderSn;
@property(nonatomic,strong)NSString *orderStatus;
@property(nonatomic,strong)NSString *paymentStatus;
@property(nonatomic,assign)float totalAmount;
@property(nonatomic,assign)int paidAmount;
@property(nonatomic,strong)NSString * createDate;
@property(nonatomic,assign)int productTotalQuantity;

@property(nonatomic,strong)NSString *shipName;
@property(nonatomic,strong)NSString *shipMobile;
@property(nonatomic,strong)NSString *shipAddress;
@property(nonatomic,strong)NSString *deliveryTypeName;
@property(nonatomic,strong)NSString *paymentConfigName;
@property(nonatomic,assign)float productTotalPrice;
@property(nonatomic,assign)float deliveryFee;
@property(nonatomic,assign)float decreaseFee;

@property(nonatomic,strong)NSString * cardCode;
@property(nonatomic,strong)NSString * cardName;
@property(nonatomic,strong)NSString * deliverynumber;
@property(nonatomic,strong)NSString * createdate;

@property(nonatomic,strong)NSString * stores;
@property(nonatomic,strong)NSString * ordersn;
@property(nonatomic,assign)int   ordertotal;
@property(nonatomic,strong)NSString * paymentConfig;
@property(nonatomic,strong)NSString * delicerytypename;



@property(nonatomic,strong)NSArray * products;
@property(nonatomic,strong)NSArray * storesDeliveryTypesList;
@property(nonatomic,strong)NSArray * storescardsList;
@property(nonatomic,strong)NSString * xid;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
