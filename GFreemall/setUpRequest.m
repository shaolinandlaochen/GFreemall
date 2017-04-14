//
//  setUpRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "setUpRequest.h"

@implementation setUpRequest
//意见反馈
+(void)feedback:(NSString *)message block:(void(^)(NSDictionary *dicDatas))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    [dicData setObject:message forKey:@"message"];
    [dicData setObject:tokenString forKey:@"token"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"feedback" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"意见反馈----%@",dic);
        NSLog(@"get意见反馈---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];


}


@end
