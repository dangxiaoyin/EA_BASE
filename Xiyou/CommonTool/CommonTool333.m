//
//  CommonTool.m
//  Running
//
//  Created by libokeji on 15/7/31.
//  Copyright (c) 2015年  力波科技. All rights reserved.
//

#import "CommonTool333.h"
//#import "MBProgressHUD+Add.h"

@implementation CommonTool333
+(NSString *)setTimeWithTime:(NSString*)time
{
    NSDate *now=[NSDate date];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:time];
    
    NSTimeInterval timeBetween=[now timeIntervalSinceDate:inputDate];
    
    int day=(int)(timeBetween/(3600*24));
    int hour=(int)(timeBetween/3600);
    int minute=(int)(timeBetween- hour*3600)/60;
    int second=timeBetween -hour*3600-minute*60;
    if (day>0)
    {
        return [NSString stringWithFormat:@"%d天前",day];
        
    }
    else if(day <=0 && hour>0)
    {
        return [NSString stringWithFormat:@"%d时前",hour];
    }
    else if(day <=0 &&hour<=0 && minute>0)
    {
        return [NSString stringWithFormat:@"%d分前",minute];
    }
    else if(day <=0 &&hour<=0 && minute<=0 && second>=0)
    {
        return  @"刚刚";
        
    }
    else
    {
        return @"未来";
    }
}
+ (void)loadingWithMsg:(NSString *)msg{
    
    [MBProgressHUD showMessag:msg toView:[UIApplication sharedApplication].keyWindow];
}
+ (void)changeImg{
    [MBProgressHUD showMessag:@"正在更换" toView:[UIApplication sharedApplication].keyWindow];
}
+ (void)search{
    [MBProgressHUD showMessag:@"正在搜索" toView:[UIApplication sharedApplication].keyWindow];
}
+ (void)sending{
    [MBProgressHUD showMessag:@"正在帮您提交" toView:[UIApplication sharedApplication].keyWindow];
}
+ (void)loading{
    
    [MBProgressHUD showMessag:@"正在加载" toView:[UIApplication sharedApplication].keyWindow];
}
+ (void)hideLoading{
    [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow animated:YES];
}

+ (void)alertData{
    [self hideLoading];
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow text:@"暂无数据!" whileExecutingBlock:nil];
}
+ (void)alertWriteWithMsg:(NSString *)msg{
    [self hideLoading];
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow text:msg whileExecutingBlock:nil];
}

//+ (void)showTabBar
//{
//    AppDelegate *appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    [appDelegate.myTabBarController setTabBarHidden:NO];
//    appDelegate.centerButton.hidden = NO;
//    
//    
//}
//#pragma mark---隐藏tabBar
//+ (void)hideTabBar{
//    AppDelegate *appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    appDelegate.centerButton.hidden = YES;
//    [appDelegate.myTabBarController setTabBarHidden:YES];
//    
//}

#pragma mark---去掉多余的分割线
+ (void)setExtraCellLineHiddenWithTableView:(UITableView *)tableView{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
#pragma mark---设置字体之间的间距
+ (void)setSpaceInContentWithContent:(NSString *)contentStr WithLabel:(UILabel *)label{
    
    //设置行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    
    //调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentStr length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
#pragma mark---设置分割线
+ (void)setSepratorLineWithX:(CGFloat)spaX WithY:(CGFloat)spaY WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithView:(UIImageView *)imgBg{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(spaX, spaY, width, height)];
    lineView.backgroundColor = RGBColor(197, 197, 197);
    [imgBg addSubview:lineView];
    
}
+ (void)setSepratorLineWithX:(CGFloat)spaX WithY:(CGFloat)spaY WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithScrollView:(UIScrollView *)scroll{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(spaX, spaY, width, height)];
    lineView.backgroundColor = RGBColor(197, 197, 197);
    [scroll addSubview:lineView];
}
+ (void)setSepratorLineWithX:(CGFloat)spaX WithY:(CGFloat)spaY WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithBgView:(UIView *)View{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(spaX, spaY, width, height)];
    lineView.backgroundColor = RGBColor(197, 197, 197);
    [View addSubview:lineView];
}
#pragma mark---设置自适应行高
+ (CGRect)setTextContentHeightWithContent:(NSString *)content WithWidth:(CGFloat)width WithFontSize:(CGFloat)fontSize{
    //自适应行高
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:fontSize]} context:nil];
    return rect;
}
#pragma mark---计算时间间隔
+ (NSTimeInterval)setTimeIntervalWithEndTime:(NSString *)issueTime{
    //计算发表时间
    NSDate *now=[NSDate date];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:issueTime];
    NSTimeInterval timeBetween=[now timeIntervalSinceDate:inputDate];
    return timeBetween;
    
}

#pragma mark---点击按钮时切换按钮选择的状态
+ (void)setButtonStateWithCurrentBtn:(UIButton *)currentBtn WithSenderBtn:(UIButton *)sender WithSelectImg:(UIImage *)seleteImg WithCustomImg:(UIImage *)customImg{
    if (currentBtn == nil){
        sender.selected = YES;
        currentBtn = sender;
        [currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [currentBtn setBackgroundImage:seleteImg forState:UIControlStateNormal];
        
    }
    else if (currentBtn !=nil && currentBtn == sender){
        sender.selected = YES;
        [currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [currentBtn setBackgroundImage:seleteImg forState:UIControlStateNormal];
        
    }
    else if (currentBtn!= sender && currentBtn!=nil){
        currentBtn.selected = NO;
        sender.selected = YES;
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sender setBackgroundImage:seleteImg forState:UIControlStateNormal];
        [currentBtn setTitleColor:RGBColor(173, 173, 173) forState:UIControlStateNormal];
        [currentBtn setBackgroundImage:customImg forState:UIControlStateNormal];
        currentBtn = sender;
    }
    
}

//字符串为空检查
+ (BOOL)isEmptyString:(NSString *)sourceStr {
    if ((NSNull *)sourceStr == [NSNull null]) {
        return YES;
    }
    if (sourceStr == NULL) {
        return YES;
    }
    if (sourceStr == nil) {
        return YES;
    }
    if ([sourceStr isEqualToString:@""]) {
        return YES;
    }
    if (sourceStr.length == 0) {
        return YES;
    }
    if ([sourceStr isEqualToString:@"null"]) {
        return YES;
    }
    return NO;
}



@end
