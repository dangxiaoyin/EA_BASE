//
//  AppDelegate.h
//  Xiyou
//
//  Created by  力波科技 on 15/8/12.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EATabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,EATabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)EATabBarController *myTabBarController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(void)setEATabBar;

@end

