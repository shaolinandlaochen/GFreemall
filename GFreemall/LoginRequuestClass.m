//
//  LoginRequuestClass.m
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "LoginRequuestClass.h"

@implementation LoginRequuestClass
//登录
+(void)LoginUsername:(NSString *)username password:(NSString *)password block:(void(^)(NSDictionary *dic))block{

    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:username forKey:@"username"];
    [dic setObject:password forKey:@"password"];
    NSDictionary *dataDic=[TheParentClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"login" Dic:dataDic block:^(NSDictionary *dic) {

        block(dic);
        
    }];


}
@end
