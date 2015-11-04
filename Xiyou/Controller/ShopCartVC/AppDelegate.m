//
//  AppDelegate.m
//  Xiyou
//
//  Created by  力波科技 on 15/8/12.
//  Copyright (c) 2015年 西游取经. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ClassViewController.h"
#import "BrandViewController.h"
#import "ShopCartViewController.h"
#import "PersonViewController.h"
#import "Pingpp.h"

#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboSDK.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    
    [ShareSDK registerApp:@"api20"];    
    
    
    //添加新浪微博应用 注册网址 http://open.weibo.com
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                             redirectUri:@"http://www.sharesdk.cn"];
    
    //添加腾讯微博应用 注册网址 http://dev.t.qq.com
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                redirectUri:@"http://www.sharesdk.cn"];
    
    //添加QQ空间应用  注册网址  http://connect.qq.com/intro/login/
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    //添加QQ应用  注册网址   http://mobile.qq.com/api/
    [ShareSDK connectQQWithQZoneAppKey:@"100371282"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
    //微信登陆的时候需要初始化
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"
                           wechatCls:[WXApi class]];
    
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"   //微信APPID
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"  //微信APPSecret
                           wechatCls:[WXApi class]];
    
    
    
    [self setEATabBar];
    
    
    return YES;
}



- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    [Pingpp handleOpenURL:url
           withCompletion:nil];
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}


-(void)setEATabBar
{
    MainViewController *avc=[[MainViewController alloc]init];
    UINavigationController *anav=[[UINavigationController alloc]initWithRootViewController:avc];
    anav.navigationBar.hidden=YES;
    
    ClassViewController *svc=[[ClassViewController alloc]init];
    UINavigationController *snav=[[UINavigationController alloc]initWithRootViewController:svc];
    snav.tabBarItem.image=[UIImage imageNamed:@"aaa"];
    snav.navigationBar.hidden=YES;
    
    BrandViewController *tvc=[[BrandViewController alloc]init];
    UINavigationController *tnav=[[UINavigationController alloc]initWithRootViewController:tvc];
    tnav.tabBarItem.image=[UIImage imageNamed:@"aaa"];
    tnav.navigationBar.hidden=YES;
    
    ShopCartViewController *fvc=[[ShopCartViewController alloc]init];
    UINavigationController *fnav=[[UINavigationController alloc]initWithRootViewController:fvc];
    fnav.navigationBar.hidden=YES;
    
    PersonViewController *mvc=[[PersonViewController alloc]init];
    UINavigationController *mnav=[[UINavigationController alloc]initWithRootViewController:mvc];
    mnav.navigationBar.hidden=YES;
    
    NSArray *controllers=@[anav,snav,tnav,fnav,mnav];
    
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [imgDic setObject:[UIImage imageNamed:@"icon_home"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"icon_home_pre"] forKey:@"Highlighted"];
    [imgDic setObject:[UIImage imageNamed:@"icon_home_pre"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [imgDic2 setObject:[UIImage imageNamed:@"icon_classify"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"icon_classify_pre"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"icon_classify_pre"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [imgDic3 setObject:[UIImage imageNamed:@"icon_brand"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"icon_brand_pre"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"icon_brand_pre"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [imgDic4 setObject:[UIImage imageNamed:@"icon_maney"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"icon_maney_pre"] forKey:@"Highlighted"];
    [imgDic4 setObject:[UIImage imageNamed:@"icon_maney_pre"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    
    [imgDic5 setObject:[UIImage imageNamed:@"icon_my"] forKey:@"Default"];
    [imgDic5 setObject:[UIImage imageNamed:@"icon_my_pre"] forKey:@"Highlighted"];
    [imgDic5 setObject:[UIImage imageNamed:@"icon_my_pre"] forKey:@"Seleted"];

    NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic4,imgDic5,nil];
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"首页",@"分类",@"品牌",@"购物车",@"个人中心", nil];
    
    self.myTabBarController =[[EATabBarController alloc]initWithViewControllers:controllers imageArray:imgArr names:nameArray];
    
    self.myTabBarController.delegate=self;
    
    [self.myTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar_bg"]];
    
    if ([self.window respondsToSelector:@selector(setRootViewController:)]) {
        
        self.window.rootViewController = self.myTabBarController;
    }
    else {
        
        [self.window addSubview:self.myTabBarController.view];
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "LiBoKeJi.Xiyou" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Xiyou" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Xiyou.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
