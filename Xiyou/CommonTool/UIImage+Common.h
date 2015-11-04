//
//  UIImage+Common.h
//  ForkLift
//
//  Created by libokeji on 15/6/11.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface UIImage (Common)
-(UIImage*)scaledToSize:(CGSize)targetSize;
-(UIImage*)scaledToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;
+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset;
@end
