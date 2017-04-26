//
//  LoginRequuestClass.h
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequuestClass : NSObject
//登录
+(void)LoginUsername:(NSString *)username password:(NSString *)password block:(void(^)(NSDictionary *dic))block;
//登录获取验证码
+(void)LogInToGeVerificationCode:(NSString *)phone country:(NSString *)country block:(void(^)(NSDictionary *dic))block;
//手机号码登录
+(void)MobilePhoneLogin:(NSString *)phone country:(NSString *)country validateCode:(NSString *)validateCode block:(void(^)(NSDictionary *dic))block;
//登录时忘记密码修改密码
+(void)ChangeThePassword:(NSString *)password confirmPassword:(NSString *)confirmPassword phone:(NSString *)phone captcha:(NSString *)captcha country:(NSString *)country block:(void(^)(NSDictionary *dic))block;
//注册
+(void)Registeredbase_username:(NSString *)base_username password:(NSString *)password confirmPassword:(NSString *)confirmPassword base_recommend:(NSString *)base_recommend phone:(NSString *)phone captcha:(NSString *)captcha country:(NSString *)country block:(void(^)(NSDictionary *dic))block;
//判断是否已经注册
+(void)DetermineWhetherHasBeenRegisteredcountry:(NSString *)country phone:(NSString *)phone block:(void(^)(NSDictionary *dic))block;
//交易密码设置
+(void)TradingPassword:(NSString *)third_pwd confirmThird_pwd:(NSString *)confirmThird_pwd block:(void(^)(NSDictionary *dic))block;
@end
