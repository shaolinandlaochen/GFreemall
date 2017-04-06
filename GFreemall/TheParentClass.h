//
//  TheParentClass.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TheParentClass : UIViewController
@property (nonatomic,assign)id delegate;
//获取颜色值公用方法
+(UIColor *)colorWithHexString:(NSString *)color;
//切换语言
+(void)languaggeSwitch;
//改变坐标
+(void)ButtonAtTheBottomOfThesize:(BOOL)size;
//文本自适应返回size
+(CGSize)StringHeight:(NSString *)stringStr Lblfont:(float)font heightOfTheMinus:(float)height;
//登录
+(void)theLogin;




@end
