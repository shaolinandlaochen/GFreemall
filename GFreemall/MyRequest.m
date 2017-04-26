//
//  MyRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyRequest.h"

@implementation MyRequest
//基本信息查询
+(void)PersonalInformationbblock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }

    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querybaseinfo" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"基本信息查询----%@",dic);
        NSLog(@"get基本信息查询---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//获取我的个人信息和订单数量等等
+(void)MyInformationAndOrderQuantityblock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"queryordercount" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取我的个人信息和订单数量等等----%@",dic);
        NSLog(@"ge获取我的个人信息和订单数量等等---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
