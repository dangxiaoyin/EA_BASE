//
//  EATabBar.m
//  EveryDayAttention
//
//  Created by 力波科技 on 15/7/1.
//  Copyright (c) 2015年 力波科技. All rights reserved.
//

#import "EATabBar.h"

@implementation EATabBar

@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize buttons = _buttons;
@synthesize labels = _labels;


- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray names:(NSArray *)nameArray
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_backgroundView];
        
        self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
        self.labels = [NSMutableArray arrayWithCapacity:[nameArray count]];
        
        UIButton *btn;
        CGFloat width = CGRectGetWidth(globalRect) / [imageArray count];
        
        for (int i = 0; i < [imageArray count]; i++)
        {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.showsTouchWhenHighlighted = YES;
            btn.tag = i;
            btn.frame = CGRectMake(width * i, 0, width, 34);
            [btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
            [btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
            [btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Seleted"] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = [UIColor clearColor];
            
            [self.buttons addObject:btn];
            [self addSubview:btn];
            
            UILabel *nameLabel = [[UILabel alloc] init];
            nameLabel.frame = CGRectMake(width * i, 32, width, 15);
            nameLabel.textAlignment = NSTextAlignmentCenter;
            nameLabel.font = [UIFont systemFontOfSize:13];
            nameLabel.text = [nameArray objectAtIndex:i];
            
            if (i == 0) {
                nameLabel.textColor =MAIN_COLOR;
            }
            else{
                nameLabel.textColor = tabBarCharaterColor;
            }
            
            [self addSubview:nameLabel];
            
            [self.labels addObject:nameLabel];
            
        }
    }
    
    return self;
}

- (void)setBackgroundImage:(UIImage *)img
{
    [_backgroundView setImage:img];
}

- (void)tabBarButtonClicked:(id)sender
{
    UIButton *btn = sender;
    
    [self selectTabAtIndex:btn.tag];
    
    NSLog(@"SECECT INDEX: %ld",(long)btn.tag);
    
    if (btn.tag==3)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"91.2" object:nil];
    }
    
    for (int i = 0; i <self.labels.count; i++) {
        
        if (i == btn.tag) {
            
            [(UILabel *)[self.labels objectAtIndex:i] setTextColor:MAIN_COLOR];
        }
        else{
            
            [(UILabel *)[self.labels objectAtIndex:i] setTextColor:tabBarCharaterColor];
        }
    }
    
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
}

- (void)selectTabAtIndex:(NSInteger)index
{
    for (int i = 0; i < [self.buttons count]; i++)
    {
        UIButton *b = [self.buttons objectAtIndex:i];
        b.selected = NO;
        //		b.userInteractionEnabled = YES;
    }
    UIButton *btn = [self.buttons objectAtIndex:index];
    btn.selected = YES;
    //	btn.userInteractionEnabled = NO;
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
    
    // Re-index the buttons
    CGFloat width = CGRectGetWidth(globalRect) / [self.buttons count];
    for (UIButton *btn in self.buttons)
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = CGRectGetWidth(globalRect) / ([self.buttons count] + 1);
    for (UIButton *b in self.buttons)
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.showsTouchWhenHighlighted = YES;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width, self.frame.size.height);
    [btn setImage:[dict objectForKey:@"Default"] forState:UIControlStateNormal];
    //    [btn setImage:[dict objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[dict objectForKey:@"Seleted"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
