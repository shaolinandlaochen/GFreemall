//
//  ShoppingCarRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShoppingCarRequest.h"

@implementation ShoppingCarRequest
//获取购车商品列表
+(void)ToGetAShoppingCartGoodsListBlock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取购车商品列表----%@",dic);
        NSLog(@"get获取购车商品列表---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
