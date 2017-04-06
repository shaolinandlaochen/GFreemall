//
//  TheParentClass.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TheParentClass.h"
#import "ViewController.h"
@interface TheParentClass ()

@end

@implementation TheParentClass

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
//颜色值
+(UIColor *)colorWithHexString:(NSString *)color{

NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+(void)languaggeSwitch{
 [[NSNotificationCenter defaultCenter]postNotificationName:@"TheLanguageWwitchBox" object:nil];
}
+(void)ButtonAtTheBottomOfThesize:(BOOL)size{
    if (size) {
         [[NSNotificationCenter defaultCenter]postNotificationName:@"big" object:nil];
    }else{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"small" object:nil];
    }
}
//文本自适应返回size
+(CGSize)StringHeight:(NSString *)stringStr Lblfont:(float)font heightOfTheMinus:(float)height{

     CGSize lblSize = [stringStr boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - height, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return lblSize;
}
//登录
//登录
+(void)theLogin{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MonitorTheLoginNotifications" object:nil];

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
