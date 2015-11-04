//
//  MessageModel.m
//  Xiyou
//
//  Created by  力波科技 on 15/9/7.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
- (id)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.xid = value;
    }
}
@end
