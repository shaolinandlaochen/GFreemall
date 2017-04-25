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
@end
