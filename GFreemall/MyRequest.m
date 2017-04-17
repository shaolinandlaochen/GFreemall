//
//  MyRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyRequest.h"

@implementation MyRequest
//获取我的个人信息
+(void)PersonalInformationbblock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }

    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querybaseinfo" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取我的个人信息----%@",dic);
        NSLog(@"get获取我的个人信息---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
