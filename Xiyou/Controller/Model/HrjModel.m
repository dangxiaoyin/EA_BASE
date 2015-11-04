//
//  HrjModel.m
//  Xiyou
//
//  Created by  力波科技 on 15/9/7.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "HrjModel.h"

@implementation HrjModel
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