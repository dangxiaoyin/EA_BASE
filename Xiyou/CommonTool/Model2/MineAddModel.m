//
//  MineAddModel.m
//  Xiyou
//
//  Created by 胡瑶瑶 on 15/10/13.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "MineAddModel.h"

@implementation MineAddModel
- (id)initWithDictinary:(NSDictionary *)dic{
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
