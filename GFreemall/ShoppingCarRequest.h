//
//  ShoppingCarRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingCarRequest : NSObject
//获取购车商品列表
+(void)ToGetAShoppingCartGoodsListBlock:(void(^)(NSDictionary *dics))block;
//用户点击cell的选中按钮这个方法用来判断是否全选并且计算价格
+(void)DetermineWhetherToChooseSelection:(NSArray *)array Block:(void(^)(BOOL isSend))blockks Block:(void(^)(NSString  *price))block;
//用户点击全选执行该方法
+(void)AUserClicksOnFutureGenerations:(BOOL)isSeleated Array:(NSArray *)array block:(void(^)(NSString *priceString))block;
//编辑状态下用户点击某行选中按钮
+(void)EditStateSelection:(NSArray *)array Block:(void(^)(BOOL isSend))block;
//删除购物车商品时需要的id拼接
+(void)DeleteShoppingCartOfGoods:(NSArray *)array block:(void(^)(NSString *IDString))block;
//接口删除购物车商品
+(void)DeleteTheGoods:(NSString *)box_id Block:(void(^)(NSDictionary *dics))block;
//修改商品数量
+(void)ModifyTheQuantity:(int)quantity isSeneld:(BOOL)isend idx:(NSInteger)idx array:(NSArray *)array Block:(void(^)(NSDictionary *dics))block;
//拼接将要支付的id
+(void)StitchingId:(NSArray *)array Block:(void(^)(NSString *IDS))block;

//购物车结算
+(void)TheShoppingCartAndSettlement:(NSString *)check_val Block:(void(^)(NSDictionary *dics))block;
@end
