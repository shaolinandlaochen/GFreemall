//
//  TheBasicInformationRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/24.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TheBasicInformationRequest.h"

@implementation TheBasicInformationRequest
//实名认证
+(void)Real_NameAuthenticationName:(NSString *)name idcard:(NSString *)idcard block:(void(^)(NSDictionary *disa))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:name forKey:@"name"];
    [dicData setObject:idcard forKey:@"idcard"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"authentication" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"/实名认证----%@",dic);
        NSLog(@"get/实名认证---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
@end
