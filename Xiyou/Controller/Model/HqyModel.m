//
//  HqyModel.m
//  Xiyou
//
//  Created by 胡瑶瑶 on 15/9/9.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "HqyModel.h"

@implementation HqyModel
- (id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"status"]) {
        NSNumber *number = [[NSNumber alloc]initWithBool:self.status];
        number = value;
    }
}
@end
