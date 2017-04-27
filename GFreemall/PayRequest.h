//
//  PayRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/21.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayRequest : NSObject
//在线钱包支付
+(void)OnlineWalletPaymentthird_pwd:(NSString *)third_pwd block:(void(^)(NSDictionary *dics))block;
//爱积分支付
+(void)LovePointsToPaythird_pwd:(NSString *)third_pwd block:(void(^)(NSDictionary *dics))block;
//爱积分支付钱币转换
+(void)PayMoneyLoveIntegralTransformation:(NSString *)serial block:(void(^)(NSDictionary *dics))block;

@end
