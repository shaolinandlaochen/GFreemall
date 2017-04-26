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
@end
