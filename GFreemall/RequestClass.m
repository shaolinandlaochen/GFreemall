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
    ////"http://192.168.88.7:8080/shop_app/login?&password=111111&timestamp=1492078968134&username=ming111"
    
    
  
    
   NSString *string= [TheParentClass TheKeyValueSequence:dic];
    NSString *sign=[TheParentClass MD5ForLower32Bate:string];
    NSString *RequestUrlString=[NSString stringWithFormat:@"%@%@?&%@&sign=%@",RequestUrl,urlStr,string,sign];
    
    
    
    
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    
    NSLog(@"请求URL==%@",RequestUrlString);
    NSURLSessionDataTask *task=[manager GET:RequestUrlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dic);
        NSLog(@"get请求msg==%@",[dic objectForKey:@"msg"]);
  
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"****get请求%@",error);
    }];
    [task resume];

}
//测试
+(void)test:(NSDictionary *)dic block:(void(^)(NSString *string))block{
    
    
    
   NSString *str= [TheParentClass TheKeyValueSequence:dic];
   NSString *MD5Str=[TheParentClass MD5ForLower32Bate:str];
    
    block(MD5Str);

}
/*
 //时间戳
 NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
 NSTimeInterval a=[dat timeIntervalSince1970]*1000;
 NSString *timeString = [NSString stringWithFormat:@"%f", a];
 NSLog(@"%@",timeString);
 */

@end
