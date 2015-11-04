//
//  EATabBarController.m
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import "EATabBarController.h"
#import "EATabBar.h"

static EATabBarController *eaTabBarController;

@implementation UIViewController (EATabBarControllerSupport)

- (EATabBarController *)leveyTabBarController
{
    return eaTabBarController;
}

@end

@interface EATabBarController (private)
-(void)displalyViewAtIndex:(NSUInteger)index;

@end

@implementation EATabBarController

@synthesize delegate = _delegate;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize selectedIndex = _selectedIndex;
@synthesize tabBarHidden = _tabBarHidden;
@synthesize animateDriect;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr names:(NSArray*)nameArray
{
    self = [super init];
    
    if (self != nil)
    {
        _viewControllers = [NSMutableArray arrayWithArray:vcs];
        CGRect rect = [[UIScreen mainScreen] bounds];
        _containerView = [[UIView alloc] initWithFrame:rect];
        
        _transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(globalRect), _containerView.frame.size.height - kTabBarHeight)];
        _transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
        
        _tabBar = [[EATabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - kTabBarHeight, CGRectGetWidth(globalRect), kTabBarHeight) buttonImages:arr names:nameArray];
        _tabBar.delegate = self;
        
        eaTabBarController = self;
        animateDriect = 0;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    [_containerView addSubview:_transitionView];
    [_containerView addSubview:_tabBar];
    self.view = _containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.selectedIndex=0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    _tabBar = nil;
    _viewControllers = nil;
}

#pragma mark - instant methods

- (EATabBar *)tabBar
{
    return _tabBar;
}
- (BOOL)tabBarTransparent
{
    return _tabBarTransparent;
}
- (void)setTabBarTransparent:(BOOL)yesOrNo
{
    if (yesOrNo == YES)
    {
        _transitionView.frame = _containerView.bounds;
    }
    else
    {
        _transitionView.frame = CGRectMake(0, 0, CGRectGetWidth(globalRect), _containerView.frame.size.height - kTabBarHeight);
    }
}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated
{
    if (yesOrNO == YES)
    {
        if (self.tabBar.frame.origin.y == self.view.frame.size.height)
        {
            return;
        }
    }
    else
    {
        if (self.tabBar.frame.origin.y == self.view.frame.size.height - kTabBarHeight)
        {
            return;
        }
    }
    
    if (animated == YES)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        if (yesOrNO == YES)
        {
            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        }
        else
        {
            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        }
        [UIView commitAnimations];
    }
    else
    {
        if (yesOrNO == YES)
        {
            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        }
        else 
        {
            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        }
    }
}
- (NSUInteger)selectedIndex
{
    //add by
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"isFromCenterView"] isEqualToString:@"YES"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"popDetail" object:nil];
    }
    return _selectedIndex;
}

- (EAFatherViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
    
}

-(void)setTabBarHidden:(BOOL)isHidden{
    _tabBar.hidden = isHidden;
    if (isHidden) {
        _transitionView.frame = CGRectMake(0, 0, CGRectGetWidth(globalRect), _containerView.frame.size.height);
    }else{
        _transitionView.frame = CGRectMake(0, 0, CGRectGetWidth(globalRect), _containerView.frame.size.height - kTabBarHeight);
    }
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    
    // Remove view from superview.
    [[(EAFatherViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    
    // Remove tab from tabbar.
    [_tabBar removeTabAtIndex:index];
}

- (void)insertViewController:(EAFatherViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:vc atIndex:index];
    [_tabBar insertTabWithImageDic:dict atIndex:index];
}


#pragma mark - Private methods

- (void)displayViewAtIndex:(NSUInteger)index
{
    // Before change index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:withTap:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index] withTap:index])
        {
            return;
        }
    }
    // If target index if equal to current index, do nothing.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        return;
    }
    //NSLog(@"Display View.");
    _selectedIndex = index;
    
    UIViewController *selectedVC = [self.viewControllers objectAtIndex:index];
    
    selectedVC.view.frame = _transitionView.frame;
    if ([selectedVC.view isDescendantOfView:_transitionView])
    {
        [_transitionView bringSubviewToFront:selectedVC.view];
    }
    else
    {
        [_transitionView addSubview:selectedVC.view];
    }
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
    {
        [_delegate tabBarController:self didSelectViewController:selectedVC];
    }
    
}

#pragma mark -
#pragma mark tabBar delegates

- (void)tabBar:(EATabBar *)tabBar didSelectIndex:(NSInteger)index
{
    if (self.selectedIndex == index) {
        
        UINavigationController *nav = [self.viewControllers objectAtIndex:index];
        
        [nav popToRootViewControllerAnimated:YES];
        
    }
    
    else {
        
        [self displayViewAtIndex:index];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushStack" object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld",(long)index],@"index",nil]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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