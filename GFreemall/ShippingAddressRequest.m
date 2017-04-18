//
//  ShippingAddressRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShippingAddressRequest.h"

@implementation ShippingAddressRequest
///获取收货地址列表
+(void)ToObtainAListShippingAddressblock:(void(^)(NSDictionary *dics))bloock{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"address" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取收货地址列表----%@",dic);
        NSLog(@"get获取收货地址列表---msg==%@",[dic objectForKey:@"msg"]);
        bloock(dic);
        
    }];
}
@end
