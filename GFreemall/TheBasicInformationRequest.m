//
//  TheBasicInformationRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/24.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TheBasicInformationRequest.h"

@implementation TheBasicInformationRequest
//实名认证
+(void)Real_NameAuthenticationName:(NSString *)name idcard:(NSString *)idcard block:(void(^)(NSDictionary *disa))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:name forKey:@"name"];
    [dicData setObject:idcard forKey:@"idcard"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"authentication" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/实名认证----%@",dic);
        NSLog(@"get/实名认证---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
//修改支付密码
+(void)ModifyPaymentPassword:(NSString *)third_pwd third_newpwd:(NSString *)third_newpwd block:(void(^)(NSDictionary *disa))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:third_pwd forKey:@"third_pwd"];
    [dicData setObject:third_newpwd forKey:@"third_newpwd"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"updthirdpwd" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/修改支付密码----%@",dic);
        NSLog(@"get修改支付密码---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}//获取验证码
+(void)GetVerificationCodeblock:(void(^)(NSDictionary *disa))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }

    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"sendphoneforget" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/获取验证码----%@",dic);
        NSLog(@"get获取验证码---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//获取手机号
+(void)GetAPhoneNumber:(void(^)(NSDictionary *disa))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"queryphone" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取手机号----%@",dic);
        NSLog(@"get获取手机号---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//注册-找回登录密码-验证码发送
+(void)LoginRegistrationVerificationCodecountry:(NSString *)country phone:(NSString *)phone block:(void(^)(NSDictionary *disa))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:country forKey:@"country"];
    [dicData setObject:phone forKey:@"phone"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"sendphonereg" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"注册-找回登录密码-验证码发送----%@",dic);
        NSLog(@"get注册-找回登录密码-验证码发送---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
@end
