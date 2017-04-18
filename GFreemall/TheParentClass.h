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
@property(nonatomic,copy)NSString *token;
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
#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str;
#pragma mark - 32位 大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str;
#pragma mark - 16位 大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str;
#pragma mark - 16位 小写
+(NSString *)MD5ForLower16Bate:(NSString *)str;
#pragma mark - 签名键值对排序
+(NSString *)TheKeyValueSequence:(NSDictionary *)dic;
#pragma mark - 单纯的排序
+(NSString *)SimpleSorting:(NSDictionary *)dataDic;
//获取时间戳
+(NSInteger)timeStamp;
////传入字典添加数据返回完整的数据
+(NSDictionary *)ReceiveTheOriginalData:(NSDictionary *)dic;
//需要重新登录
+(void)YouNeedToLogIn:(NSString *)message;
//检测网络
+(BOOL)DoYouHaveAnyNetwork;
//查看图片一张
+(void)SeeAPicture:(NSString *)imgUrl Controller:(UIViewController *)Controller;
//查看多张图片
+(void)ToSeeMorePictures:(NSArray *)Array idx:(NSInteger)idx Controller:(UIViewController *)Controller;

@end
