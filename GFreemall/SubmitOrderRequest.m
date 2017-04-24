//
//  SubmitOrderRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/21.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SubmitOrderRequest.h"

@implementation SubmitOrderRequest
//提交订单(商品)
+(void)GoodsSubmitOrderscountry:(NSString *)country province:(NSString *)province city:(NSString *)city area:(NSString *)area address:(NSString *)address phone:(NSString *)phone name:(NSString *)name num:(NSString *)num attribute:(NSString *)attribute pay_type:(NSString *)pay_type zipcode:(NSString *)zipcode checkRes:(NSString *)checkRes comm_serial:(NSString *)comm_serial block:(void(^)(NSDictionary *dics))block{

    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:country forKey:@"country"];
    [dicData setObject:province forKey:@"province"];
    [dicData setObject:city forKey:@"city"];
    [dicData setObject:area forKey:@"area"];
    [dicData setObject:address forKey:@"address"];
    [dicData setObject:phone forKey:@"phone"];
    [dicData setObject:name forKey:@"name"];
    [dicData setObject:num forKey:@"num"];
    [dicData setObject:attribute forKey:@"attribute"];
    [dicData setObject:pay_type forKey:@"pay_type"];
    [dicData setObject:zipcode forKey:@"zipcode"];
    [dicData setObject:checkRes forKey:@"checkRes"];
    [dicData setObject:comm_serial forKey:@"comm_serial"];
    
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"pay" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"提交订单(商品)----%@",dic);
        NSLog(@"get提交订单(商品)---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//提交订单购物车
+(void)SubmitOrdersAShoppingCart:(NSString *)country province:(NSString *)province city:(NSString *)city area:(NSString *)area address:(NSString *)address phone:(NSString *)phone name:(NSString *)name num:(NSString *)num attribute:(NSString *)attribute pay_type:(NSString *)pay_type zipcode:(NSString *)zipcode commBox:(NSString *)commBox block:(void(^)(NSDictionary *dics))block{

    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:country forKey:@"country"];
    [dicData setObject:province forKey:@"province"];
    [dicData setObject:city forKey:@"city"];
    [dicData setObject:area forKey:@"area"];
    [dicData setObject:address forKey:@"address"];
    [dicData setObject:phone forKey:@"phone"];
    [dicData setObject:name forKey:@"name"];
    //[dicData setObject:num forKey:@"num"];
    if (attribute!=nil) {
        [dicData setObject:attribute forKey:@"attribute"];
    }
    [dicData setObject:pay_type forKey:@"pay_type"];
    [dicData setObject:zipcode forKey:@"zipcode"];
    [dicData setObject:commBox forKey:@"commBox"];
    
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"paycarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"//提交订单购物车----%@",dic);
        NSLog(@"get//提交订单购物车---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
//获取订单列表
+(void)ToObtainAListOrder:(NSString *)type page:(int)page pageSize:(int)pageSize block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:type forKey:@"type"];
    [dicData setObject:@(page) forKey:@"page"];
    [dicData setObject:@(pageSize) forKey:@"pageSize"];

    
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"order" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取订单列表----%@",dic);
        NSLog(@"get获取订单列表---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
@end
