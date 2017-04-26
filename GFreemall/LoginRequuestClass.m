//
//  LoginRequuestClass.m
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "LoginRequuestClass.h"

@implementation LoginRequuestClass
//登录
+(void)LoginUsername:(NSString *)username password:(NSString *)password block:(void(^)(NSDictionary *dic))block{

    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:username forKey:@"username"];
    [dic setObject:password forKey:@"password"];
    NSDictionary *dataDic=[TheParentClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"login" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"登录结果%@",dic);
        block(dic);
        
    }];


}
//登录获取验证码
+(void)LogInToGeVerificationCode:(NSString *)phone country:(NSString *)country block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dic setObject:tokenString forKey:@"token"];
    }
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:country forKey:@"country"];
    NSDictionary *dataDic=[TheParentClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"sendphonelogin" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"登录获取验证码%@",dic);
        block(dic);
        
    }];
}
//手机号码登录
+(void)MobilePhoneLogin:(NSString *)phone country:(NSString *)country validateCode:(NSString *)validateCode block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dic setObject:tokenString forKey:@"token"];
    }
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:country forKey:@"country"];
    [dic setObject:validateCode forKey:@"validateCode"];
    NSDictionary *dataDic=[TheParentClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"phonelogin" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"手机号码登录%@",dic);
        block(dic);
        
    }];
}
//登录时忘记密码修改密码
+(void)ChangeThePassword:(NSString *)password confirmPassword:(NSString *)confirmPassword phone:(NSString *)phone captcha:(NSString *)captcha country:(NSString *)country block:(void(^)(NSDictionary *dic))block{

    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dic setObject:tokenString forKey:@"token"];
    }
    [dic setObject:phone forKey:@"phone"];
    [dic setObject:country forKey:@"country"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:confirmPassword forKey:@"confirmPassword"];
    [dic setObject:captcha forKey:@"captcha"];
    NSDictionary *dataDic=[TheParentClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"modpwd" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"登录时忘记密码修改密码%@",dic);
        block(dic);
        
    }];

}
@end
