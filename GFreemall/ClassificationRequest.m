//
//  ClassificationRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ClassificationRequest.h"

@implementation ClassificationRequest
//获取数据
+(void)ForCategoricalData:(void(^)(NSDictionary *dicData))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycategory" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"分类获取数据----%@",dic);
        NSLog(@"get意分类获取数据---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
@end
