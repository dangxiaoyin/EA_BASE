//
//  MainModel.h
//  Running
//
//  Created by libokeji on 15/8/4.
//  Copyright (c) 2015年  力波科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property(nonatomic,strong)NSDictionary *message;
@property(nonatomic,assign)NSString *status;
- (id)initWithDictinary:(NSDictionary *)dic;
@end
