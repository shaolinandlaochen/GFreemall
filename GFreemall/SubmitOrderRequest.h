//
//  SubmitOrderRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/21.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubmitOrderRequest : NSObject
//提交订单(商品)
+(void)GoodsSubmitOrderscountry:(NSString *)country province:(NSString *)province city:(NSString *)city area:(NSString *)area address:(NSString *)address phone:(NSString *)phone name:(NSString *)name num:(NSString *)num attribute:(NSString *)attribute pay_type:(NSString *)pay_type zipcode:(NSString *)zipcode checkRes:(NSString *)checkRes comm_serial:(NSString *)comm_serial block:(void(^)(NSDictionary *dics))block;
//提交订单购物车
+(void)SubmitOrdersAShoppingCart:(NSString *)country province:(NSString *)province city:(NSString *)city area:(NSString *)area address:(NSString *)address phone:(NSString *)phone name:(NSString *)name num:(NSString *)num attribute:(NSString *)attribute pay_type:(NSString *)pay_type zipcode:(NSString *)zipcode commBox:(NSString *)commBox block:(void(^)(NSDictionary *dics))block;
//获取订单列表
+(void)ToObtainAListOrder:(NSString *)type page:(int)page pageSize:(int)pageSize block:(void(^)(NSDictionary *dics))block;
@end
