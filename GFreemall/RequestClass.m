//
//  RequestClass.m
//  GFreemall
//
//  Created by 123 on 2017/4/13.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "RequestClass.h"

@implementation RequestClass
//post请求
+(void)postUrl:(NSString *)url Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block{

    
}
//get请求
+(void)getUrl:(NSString *)urlStr Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block{


}
//测试
+(void)test:(NSDictionary *)dic block:(void(^)(NSString *string))block{
    
   NSString *str= [TheParentClass TheKeyValueSequence:dic];
   NSString *MD5Str=[TheParentClass MD5ForLower32Bate:str];
    
    block(MD5Str);

}


@end
