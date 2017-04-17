//
//  MessageRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MessageRequest.h"

@implementation MessageRequest
//获取消息列表
+(void)AccessToTheMessageListBlock:(void(^)(NSDictionary *dics))block{
    
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:@(1) forKey:@"page"];
    [dicData setObject:@(999) forKey:@"pageSize"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"message" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取消息列表----%@",dic);
        NSLog(@"get获取消息列表---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//获取消息详情
+(void)GetNewsDetailsmessage_id:(int)message_id Block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:@(message_id) forKey:@"message_id"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"setmessageread" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取消息详情----%@",dic);
        NSLog(@"get获取消息详情---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
