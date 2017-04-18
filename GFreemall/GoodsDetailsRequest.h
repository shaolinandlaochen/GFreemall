//
//  GoodsDetailsRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsDetailsRequest : NSObject
//获取商品详情信息
+(void)ForProductInformationc:(NSString *)c block:(void(^)(NSDictionary *dics))block;
//获取商品评价列表
+(void)ToObtainAListEvaluationqueryType:(NSString *)queryType serial:(NSString *)serial block:(void(^)(NSDictionary *dics))block;
@end
