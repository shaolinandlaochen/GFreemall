//
//  ShippingAddressRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShippingAddressRequest : NSObject
///获取收货地址列表
+(void)ToObtainAListShippingAddressblock:(void(^)(NSDictionary *dics))bloock;
//添加收货地址
+(void)AddAShippingAddressaddress_name:(NSString *)address_name address_phone:(NSString *)address_phone address_country:(NSString *)address_country address_province:(NSString *)address_province address_city:(NSString *)address_city address_area:(NSString *)address_area address_address:(NSString *)address_address address_isdefault:(NSString *)address_isdefault block:(void(^)(NSDictionary *dics))block;
//删除地址
+(void)delegateAddressString:(int)ID block:(void(^)(NSDictionary *dics))block;
//修改收货地址
+(void)ModifyTheShippingAddressID:(int)ID address_name:(NSString *)address_name address_phone:(NSString *)address_phone address_country:(NSString *)address_country address_province:(NSString *)address_province address_city:(NSString *)address_city address_area:(NSString *)address_area address_address:(NSString *)address_address address_isdefault:(NSString *)address_isdefault block:(void(^)(NSDictionary *dics))block;
@end
