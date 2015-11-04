//
//  Des1.h
//  Xiyou
//
//  Created by  力波科技 on 15/9/6.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@interface Des1 : NSObject

+ (NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;
+ (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key
;

@end
