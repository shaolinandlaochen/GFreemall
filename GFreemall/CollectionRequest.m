//
//  CollectionRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//


#import "CollectionRequest.h"

@implementation CollectionRequest
//获取收藏数据
+(void)ToObtainAListCollectionblock:(void(^)(NSDictionary *dic))block{

    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
          [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:@(1) forKey:@"page"];
    [dicData setObject:@(999) forKey:@"pageSize"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"collection" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取收藏数据----%@",dic);
        NSLog(@"get获取收藏数据---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//删除收藏
+(void)delegateGoods:(NSString *)idStr block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:idStr forKey:@"id"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"collectiondel" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/删除收藏---%@",dic);
        NSLog(@"get/删除收藏---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
