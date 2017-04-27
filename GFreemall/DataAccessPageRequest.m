//
//  DataAccessPageRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "DataAccessPageRequest.h"

@implementation DataAccessPageRequest
//获取首页数据
+(void)DataAccessPageRequestBlock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"index" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取首页数据----%@",dic);
        NSLog(@"get获取首页数据---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//获取未读消息数量
+(void)GetNumbeOfUnreadMessagesBlock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"nomessageread" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取未读消息数量----%@",dic);
        NSLog(@"get获取未读消息数量---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
