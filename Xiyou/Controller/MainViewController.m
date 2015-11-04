//
//  MainViewController.m
//  Xiyou
//
//  Created by yxk on 15/11/4.
//  Copyright © 2015年 西游取经. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}


-(void)onTimer
{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}


@end
