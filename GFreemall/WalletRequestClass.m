//
//  WalletRequestClass.m
//  GFreemall
//
//  Created by 123 on 2017/4/25.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "WalletRequestClass.h"

@implementation WalletRequestClass
//钱包余额查询
+(void)walletBalanceQueryblock:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }

    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycremain" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/钱包余额查询----%@",dic);
        NSLog(@"get/钱包余额查询---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
//充值记录
+(void)PrepaidPhoneRecordsDicpage:(NSString *)page pageSize:(NSString *)pageSize start:(NSString *)start end:(NSString *)end type:(NSString *)type url:(NSString *)url block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:page forKey:@"page"];
    [dicData setObject:pageSize forKey:@"pageSize"];
    if (start!=nil) {
         [dicData setObject:start forKey:@"start"];
    }
    if (end!=nil) {
        [dicData setObject:end forKey:@"end"];
    }
    if (type!=nil) {
        
        [dicData setObject:type forKey:@"type"];
    }
   
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:url Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/充值记录或者其他----%@",dic);
        NSLog(@"get/充值记录或者其他---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//设置支付密码
+(void)SetUpToPayThePassword:(NSString *)third_pwd validateCode:(NSString *)validateCode block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
     [dicData setObject:third_pwd forKey:@"third_pwd"];
    [dicData setObject:validateCode forKey:@"validateCode"];
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycremain" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/设置支付密码----%@",dic);
        NSLog(@"get/设置支付密码---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
@end
