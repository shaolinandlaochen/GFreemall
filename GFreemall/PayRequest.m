//
//  PayRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/21.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PayRequest.h"

@implementation PayRequest
//在线钱包支付
+(void)OnlineWalletPaymentthird_pwd:(NSString *)third_pwd block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:third_pwd forKey:@"third_pwd"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"paybywallet" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/在线钱包支付----%@",dic);
        NSLog(@"get/在线钱包支付---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//爱积分支付
+(void)LovePointsToPaythird_pwd:(NSString *)third_pwd block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:third_pwd forKey:@"third_pwd"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"paybygfm" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/爱积分支付----%@",dic);
        NSLog(@"get/爱积分支付---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//爱积分支付钱币转换
+(void)PayMoneyLoveIntegralTransformation:(NSString *)serial block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querypricebyserial" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/爱积分支付钱币转换----%@",dic);
        NSLog(@"get/爱积分支付钱币转换---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
