//
//  GoodsDetailsRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GoodsDetailsRequest.h"

@implementation GoodsDetailsRequest
//获取商品详情信息
+(void)ForProductInformationc:(NSString *)c block:(void(^)(NSDictionary *dics))block{

    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    if (c!=nil) {
          [dicData setObject:c forKey:@"c"];
    }
  
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycommdetail" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取商品详情信息----%@",dic);
        NSLog(@"get获取商品详情信息---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//获取商品评价列表
+(void)ToObtainAListEvaluationqueryType:(NSString *)queryType serial:(NSString *)serial block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    if (queryType!=nil) {
        [dicData setObject:queryType forKey:@"queryType"];
    }
     [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycomment" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取商品评价列表----%@",dic);
        NSLog(@"get获取商品评价列表---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];


}
//收藏
+(void)CollectionOrCancelThisCollection:(NSString *)serial block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"addcollection" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"收藏----%@",dic);
        NSLog(@"get收藏---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//加入购物车
+(void)AddTToCartvalues:(NSString *)values serial:(NSString *)serial num:(NSString *)num checkRes:(NSString *)checkRes block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:values forKey:@"values"];
    [dicData setObject:num forKey:@"num"];
    [dicData setObject:checkRes forKey:@"checkRes"];
    [dicData setObject:serial forKey:@"serial"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"addcarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/加入购物车---%@",dic);
        NSLog(@"get/加入购物车---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
@end
