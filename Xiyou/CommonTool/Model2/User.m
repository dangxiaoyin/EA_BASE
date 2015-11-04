//
//  User.m
//  ForkLift
//
//  Created by 力波科技 on 15/6/3.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import "User.h"
@implementation User
-(id)initWithDictionary:(NSDictionary *)dic
{
    if (self=[super init])
    {
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.xid = value;
    }
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
   
    [aCoder encodeObject:self.xid forKey:@"id"];
    [aCoder encodeObject:self.iscom forKey:@"iscom"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.logo forKey:@"logo"];
    [aCoder encodeObject:self.memberRankName forKey:@"memberRankName"];
    
    
    
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.realname forKey:@"realname"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.sex  forKey:@"sex"];
    [aCoder encodeObject:self.age  forKey:@"age"];
    [aCoder encodeObject:self.idnumber forKey:@"idnumber"];
    [aCoder encodeObject:self.idcardface forKey:@"idcardface"];
    [aCoder encodeObject:self.idcardback forKey:@"idcardback"];
    
    
    [aCoder encodeObject:self.orCode forKey:@"orCode"];
    [aCoder encodeObject:self.vitalCapacity forKey:@"vitalCapacity"];
    [aCoder encodeObject:self.weight forKey:@"weight"];
    [aCoder encodeObject:self.interest forKey:@"lable"];
    [aCoder encodeObject:self.nickName forKey:@"signature"];
    [aCoder encodeObject:self.background forKey:@"backgroud"];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init])
    {
       
        self.xid=[aDecoder decodeObjectForKey:@"id"];
        self.iscom=[aDecoder decodeObjectForKey:@"iscom"];
        self.username=[aDecoder decodeObjectForKey:@"username"];
        self.logo=[aDecoder decodeObjectForKey:@"logo"];
        self.memberRankName=[aDecoder decodeObjectForKey:@"memberRankName"];
        
        
        
        self.nickname=[aDecoder decodeObjectForKey:@"nickname"];
        self.realname=[aDecoder decodeObjectForKey:@"realname"];
        self.email=[aDecoder decodeObjectForKey:@"email"];
        self.mobile=[aDecoder decodeObjectForKey:@"mobile"];
        self.address=[aDecoder decodeObjectForKey:@"address"];
        self.sex=[aDecoder decodeObjectForKey:@"sex"];
        self.age=[aDecoder decodeObjectForKey:@"age"];
        self.idnumber=[aDecoder decodeObjectForKey:@"idnumber"];
        self.idcardface=[aDecoder decodeObjectForKey:@"idcardface"];
        self.idcardback=[aDecoder decodeObjectForKey:@"idcardback"];
        
        
        self.vitalCapacity=[aDecoder decodeObjectForKey:@"vitalCapacity"];
        
        self.weight=[aDecoder decodeObjectForKey:@"weight"];
        self.interest=[aDecoder decodeObjectForKey:@"lable"];
        self.nickName=[aDecoder decodeObjectForKey:@"signature"];
        self.orCode=[aDecoder decodeObjectForKey:@"orCode"];
        self.background = [aDecoder decodeObjectForKey:@"background"];
        
        
    }
    return self;
}
@end
