//
//  GoodsAndEvaluationRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/25.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GoodsAndEvaluationRequest.h"

@implementation GoodsAndEvaluationRequest
//评价晒单
+(void)EvaluationOfBaskInSingle:(NSString *)order_serial comment_content:(NSString *)comment_content comment_grade:(int)comment_grade commodity_serial:(NSString *)commodity_serial order_commodity_id:(NSString *)order_commodity_id block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:order_serial forKey:@"order_serial"];
    [dicData setObject:comment_content forKey:@"comment_content"];
    [dicData setObject:@(comment_grade) forKey:@"comment_grade"];
    [dicData setObject:commodity_serial forKey:@"commodity_serial"];
    [dicData setObject:order_commodity_id forKey:@"order_commodity_id"];
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"ordercomment" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"评价晒单----%@",dic);
        NSLog(@"get评价晒单---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
