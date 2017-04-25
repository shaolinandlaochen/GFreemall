//
//  GoodsAndEvaluationRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/25.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsAndEvaluationRequest : NSObject
//评价晒单
+(void)EvaluationOfBaskInSingle:(NSString *)order_serial comment_content:(NSString *)comment_content comment_grade:(int)comment_grade commodity_serial:(NSString *)commodity_serial order_commodity_id:(NSString *)order_commodity_id block:(void(^)(NSDictionary *dics))block;
@end
