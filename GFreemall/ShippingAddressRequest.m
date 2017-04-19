//
//  ShippingAddressRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShippingAddressRequest.h"

@implementation ShippingAddressRequest
///获取收货地址列表
+(void)ToObtainAListShippingAddressblock:(void(^)(NSDictionary *dics))bloock{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"address" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取收货地址列表----%@",dic);
        NSLog(@"get获取收货地址列表---msg==%@",[dic objectForKey:@"msg"]);
        bloock(dic);
        
    }];
}
//添加收货地址
+(void)AddAShippingAddressaddress_name:(NSString *)address_name address_phone:(NSString *)address_phone address_country:(NSString *)address_country address_province:(NSString *)address_province address_city:(NSString *)address_city address_area:(NSString *)address_area address_address:(NSString *)address_address address_isdefault:(NSString *)address_isdefault block:(void(^)(NSDictionary *dics))block{

    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
      [dicData setObject:address_name forKey:@"address_name"];
      [dicData setObject:address_phone forKey:@"address_phone"];
      [dicData setObject:address_country forKey:@"address_country"];
      [dicData setObject:address_province forKey:@"address_province"];
      [dicData setObject:address_city forKey:@"address_city"];
      [dicData setObject:address_area forKey:@"address_area"];
      [dicData setObject:address_address forKey:@"address_address"];
      [dicData setObject:address_isdefault forKey:@"address_isdefault"];
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"addressadd" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"添加收货地址----%@",dic);
        NSLog(@"get获添加收货地址---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];



}
//删除地址
+(void)delegateAddressString:(int)ID block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:@(ID) forKey:@"id"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"addressdel" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/删除地址----%@",dic);
        NSLog(@"get/删除地址---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
//修改收货地址
+(void)ModifyTheShippingAddressID:(int)ID address_name:(NSString *)address_name address_phone:(NSString *)address_phone address_country:(NSString *)address_country address_province:(NSString *)address_province address_city:(NSString *)address_city address_area:(NSString *)address_area address_address:(NSString *)address_address address_isdefault:(NSString *)address_isdefault block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:address_name forKey:@"address_name"];
    [dicData setObject:@(ID) forKey:@"id"];
    [dicData setObject:address_phone forKey:@"address_phone"];
    [dicData setObject:address_country forKey:@"address_country"];
    [dicData setObject:address_province forKey:@"address_province"];
    [dicData setObject:address_city forKey:@"address_city"];
    [dicData setObject:address_area forKey:@"address_area"];
    [dicData setObject:address_address forKey:@"address_address"];
    [dicData setObject:address_isdefault forKey:@"address_isdefault"];
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"addressupdate" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"修改收货地址----%@",dic);
        NSLog(@"get修改收货地址---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];


}

@end
