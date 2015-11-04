//
//  EATabBarController.h
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EATabBar.h"
#import "EAFatherViewController.h"

@class UITabBarController;

@protocol EATabBarControllerDelegate;

@interface EATabBarController : UIViewController<EATabBarDelegate>
{
    EATabBar *_tabBar;
    UIView      *_containerView;
    UIView		*_transitionView;
    id<EATabBarControllerDelegate>__unsafe_unretained _delegate;
    NSMutableArray *_viewControllers;
    NSUInteger _selectedIndex;
    
    BOOL _tabBarTransparent;
    BOOL _tabBarHidden;
    
    NSInteger animateDriect;
}


@property(nonatomic,copy)NSArray *viewControllers;
@property(nonatomic,readonly)EAFatherViewController *selectedViewController;
@property(nonatomic)NSUInteger selectedIndex;

@property(nonatomic,readonly)EATabBar *tabBar;
@property(nonatomic,assign)id<EATabBarControllerDelegate> delegate;

// Default is NO, if set to YES, content will under tabbar
@property(nonatomic)BOOL tabBarTransparent;
@property(nonatomic)BOOL tabBarHidden;

@property(nonatomic,assign)NSInteger animateDriect;


-(id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray*)arr names:(NSArray*)nameArray;
-(void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated driect:(NSInteger)driect;
// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(EAFatherViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;

-(void)setTabBarHidden:(BOOL)isHidden;

@end

@protocol EATabBarControllerDelegate <NSObject>

@optional

- (BOOL)tabBarController:(EATabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController withTap:(NSUInteger)tabIndex;
- (void)tabBarController:(EATabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface UIViewController (EATabBarControllerSupport)

@property(nonatomic, readonly) EATabBarController *leveyTabBarController;

@end