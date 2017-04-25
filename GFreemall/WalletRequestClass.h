//
//  WalletRequestClass.h
//  GFreemall
//
//  Created by 123 on 2017/4/25.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalletRequestClass : NSObject
//钱包余额查询
+(void)walletBalanceQueryblock:(void(^)(NSDictionary *dic))block;
//充值记录
+(void)PrepaidPhoneRecordsDicpage:(NSString *)page pageSize:(NSString *)pageSize start:(NSString *)start end:(NSString *)end type:(NSString *)type url:(NSString *)url block:(void(^)(NSDictionary *dic))block;
//设置支付密码
+(void)SetUpToPayThePassword:(NSString *)third_pwd validateCode:(NSString *)validateCode block:(void(^)(NSDictionary *dic))block;
@end
