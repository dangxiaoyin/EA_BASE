//
//  HrjModel.h
//  Xiyou
//
//  Created by  力波科技 on 15/9/7.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HrjModel : NSObject

@property (nonatomic,strong)NSArray * message;
@property (nonatomic,assign)BOOL        status;
- (id)initWithDictionary:(NSDictionary *)dic;

@property(nonatomic,strong)NSArray * levelList;

@end
