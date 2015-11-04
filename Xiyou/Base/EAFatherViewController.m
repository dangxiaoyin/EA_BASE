//
//  EAFatherViewController.m
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import "EAFatherViewController.h"

@interface EAFatherViewController ()<ShareStatusBarDelegate>
{
    User *currentUser;
}

@end

@implementation EAFatherViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        CGRect rect=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, TarBarHeight);
        self.navBar=[[EveryDayShareStatusBar alloc]initWithFrame:rect delegate:self];
        self.navBar.backBtn.hidden=YES;
        [self.view addSubview:self.navBar];
        //[self hideTabBar:YES];
        
        if ([[UIDevice currentDevice] systemVersion].floatValue>=7.0) {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        #pragma mark - 导航条继承
        
        //self.navBar.backgroundColor=MainColor;
        self.navBar.backgroundColor = [UIColor darkGrayColor];
        
        self.navBar.titleLabel.textColor=[UIColor whiteColor];
        self.navBar.backBtn.hidden=NO;
        [self.navBar.backBtn setImage:[UIImage imageNamed:@"my_back111@3x"] forState:UIControlStateNormal];
        
        self.navBar.rightBtn.hidden=NO;
        [self.navBar.rightBtn setImage:[UIImage imageNamed:@"icon_home_code555@3x"] forState:UIControlStateNormal];

    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor=BackGroundColor;
    
    NSData *userData=[[NSUserDefaults standardUserDefaults]objectForKey:@"CurrentUser"];
    
    currentUser =[NSKeyedUnarchiver unarchiveObjectWithData:userData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏tabBar

- (void) hideTabBar:(BOOL) hidden{
    
    AppDelegate *appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    appDelegate.myTabBarController.tabBar.hidden=YES;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    
    for(UIView *view in appDelegate.myTabBarController.view.subviews)
    {
        if([view isKindOfClass:[EATabBar class]])
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, globalRect.size.height, view.frame.size.width, view.frame.size.height)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x,globalRect.size.height-kTabBarHeight, view.frame.size.width, view.frame.size.height)];
            }
        }
        
        else
        {
            if (hidden) {
                
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, globalRect.size.height)];
            }
            else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,  globalRect.size.height-kTabBarHeight)];
            }
        }
    }
    
    [UIView commitAnimations];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSString *)shareStatusBarTitle
{
    return @"APP_TITLE";
}
-(void)rightBtnClick:(UIButton *)btn
{
    NSLog(@"RIGHT_BTN_CLICK");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
