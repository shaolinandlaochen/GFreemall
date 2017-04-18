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
@end
