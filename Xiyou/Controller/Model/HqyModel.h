//
//  HqyModel.h
//  Xiyou
//
//  Created by 胡瑶瑶 on 15/9/9.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HqyModel : NSObject
@property (nonatomic,strong)NSMutableArray * paymentList;
@property (nonatomic,strong)NSMutableArray * addressList;

@property (nonatomic,strong)NSMutableArray * productList;
@property (nonatomic,strong)NSMutableArray * storesDeliveryTypesList;
@property (nonatomic,strong)NSMutableArray * storescardsList;
@property(nonatomic,assign)BOOL        status;

//@property(nonatomic,strong)NSString * description;
//@property(nonatomic,strong)NSString * image;
//@property (nonatomic,strong)NSMutableArray * drawRollsList;
//@property (nonatomic,strong)NSMutableArray * winnList;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
