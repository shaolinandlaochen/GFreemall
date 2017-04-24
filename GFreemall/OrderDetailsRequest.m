//
//  OrderDetailsRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/24.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderDetailsRequest.h"

@implementation OrderDetailsRequest
//获取订单详情
+(void)OrderDetails:(NSString *)serial block:(void(^)(NSDictionary *dics))block{

    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"orderdetails" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取订单详情----%@",dic);
        NSLog(@"get获取订单详情---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//确认收货
+(void)ConfirmTheGoods:(NSString *)serial block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"orderconfirm" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"确认收货----%@",dic);
        NSLog(@"get确认收货---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//订单付款
+(void)OrderPaymentToJump:(NSString *)serial block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"orderpay" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"订单付款----%@",dic);
        NSLog(@"get订单付款---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
