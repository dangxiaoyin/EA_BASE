//
//  MainModel.m
//  Running
//
//  Created by libokeji on 15/8/4.
//  Copyright (c) 2015年  力波科技. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
- (id)initWithDictinary:(NSDictionary *)dic{
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
