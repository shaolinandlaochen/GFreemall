//
//  TheBasicInformationRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/24.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheBasicInformationRequest : NSObject
//实名认证
+(void)Real_NameAuthenticationName:(NSString *)name idcard:(NSString *)idcard block:(void(^)(NSDictionary *disa))block;
//修改支付密码
+(void)ModifyPaymentPassword:(NSString *)third_pwd third_newpwd:(NSString *)third_newpwd block:(void(^)(NSDictionary *disa))block;
//安全验证获取验证码
+(void)GetVerificationCodeblock:(void(^)(NSDictionary *disa))block;
//获取手机号
+(void)GetAPhoneNumber:(void(^)(NSDictionary *disa))block;
//注册-找回登录密码-验证码发送
+(void)LoginRegistrationVerificationCodecountry:(NSString *)country phone:(NSString *)phone type:(NSString *)type block:(void(^)(NSDictionary *disa))block;
//查询邮箱是否存在
+(void)QueryWhetherEmailAlreadyExistsbase_email:(NSString *)base_email block:(void(^)(NSDictionary *disa))block;
//发送邮箱验证码
+(void)E_mailVerificationCodeSentbase_email:(NSString *)base_email block:(void(^)(NSDictionary *disa))block;
//绑定邮箱
+(void)BindingEmail:(NSString *)base_email captcha:(NSString *)captcha block:(void(^)(NSDictionary *disa))block;
@end
