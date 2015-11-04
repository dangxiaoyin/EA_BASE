//
//  EATabBar.h
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EATabBarDelegate;

@interface EATabBar : UIView
{
    UIImageView *_backgroundView;
    
    id<EATabBarDelegate>__unsafe_unretained _delegate;
    
    NSMutableArray *_buttons;
    
    NSMutableArray *_labels;
 
}

@property(nonatomic,retain)UIImageView *backgroundView;
@property(nonatomic,assign)id<EATabBarDelegate> delegate;
@property(nonatomic,strong)NSMutableArray *buttons;
@property(nonatomic,strong)NSMutableArray *labels;


-(id)initWithFrame:(CGRect)frame buttonImages:(NSArray*)imageArray names:(NSArray*)nameArray;
-(void)selectTabAtIndex:(NSInteger)index;
-(void)removeTabAtIndex:(NSInteger)index;
-(void)insertTabWithImageDic:(NSDictionary *)dict  atIndex:(NSUInteger)index;
-(void)setBackgroundImage:(UIImage*)img;

@end

@protocol EATabBarDelegate <NSObject>

@optional

-(void)tabBar:(EATabBar*)tabBar didSelectIndex:(NSInteger)index;

@end
