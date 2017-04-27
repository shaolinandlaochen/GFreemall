//
//  SearchRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SearchRequest.h"

@implementation SearchRequest
//获取搜索数据
+(void)AccessToSearchData:(NSString *)string page:(NSString *)page pageSize:(NSString *)pageSize queryType:(NSString *)queryType  priceType:(NSString *)priceType brandSerial:(NSString *)brandSerial categorySerial:(NSString *)categorySerial bolck:(void(^)(NSDictionary *dic))bolck{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:string forKey:@"input_search"];
     [dicData setObject:page forKey:@"page"];
     [dicData setObject:pageSize forKey:@"pageSize"];
     [dicData setObject:queryType forKey:@"queryType"];
     [dicData setObject:priceType forKey:@"priceType"];
     [dicData setObject:brandSerial forKey:@"brandSerial"];
    if (categorySerial!=nil) {
         [dicData setObject:categorySerial forKey:@"categorySerial"];
    }
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getAddressUrl:@"search" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取搜索数据----%@",dic);
        NSLog(@"get获取搜索数据---msg==%@",[dic objectForKey:@"msg"]);
        bolck(dic);
        
    }];
}
@end
