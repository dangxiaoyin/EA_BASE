//
//  DiscountTicketModel.h
//  Xiyou
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "BaseJSONModel.h"

@interface ValidDateModel : BaseJSONModel

@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *day;
@property (nonatomic,copy) NSString *hours;
@property (nonatomic,copy) NSString *minutes;
@property (nonatomic,copy) NSString *month;
@property (nonatomic,copy) NSString *nanos;
@property (nonatomic,copy) NSString *seconds;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *timezoneOffset;
@property (nonatomic,copy) NSString *year;

@end

@interface DiscountTicketModel : BaseJSONModel

@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *storeid;
@property (nonatomic,copy) NSString *storename;

@property (nonatomic, strong) NSDictionary *validDate;

@property (nonatomic, strong) ValidDateModel *dateModel;

@end
