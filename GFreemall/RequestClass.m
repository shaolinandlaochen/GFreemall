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
    
    
    
   
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];

    
    NSString *RequestUrlString=[NSString stringWithFormat:@"%@%@",RequestUrl,url];
    NSLog(@"post请求数据:%@",dic);
    NSLog(@"post请求端口号:%@",RequestUrlString);
    NSURLSessionDataTask*task= [manager POST:RequestUrlString parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *Dictionary=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        block(Dictionary);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    [task resume];
    
}
//get请求
+(void)getUrl:(NSString *)urlStr Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block{
    
    
    NSString *string= [TheParentClass SimpleSorting:dic];//请求数据排序
    NSString *RequestUrlString=[NSString stringWithFormat:@"%@%@?&%@",RequestUrl,urlStr,string];//将签名和请求数据以及端口号拼接亲来形成get请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    
    NSLog(@"请求URL==%@",RequestUrlString);
    NSURLSessionDataTask *task=[manager GET:RequestUrlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *Dictionary=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];

        block(Dictionary);
  
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"****get请求%@",error);
    }];
    [task resume];

}



/*
 //时间戳
 NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
 NSTimeInterval a=[dat timeIntervalSince1970]*1000;
 NSString *timeString = [NSString stringWithFormat:@"%f", a];
 NSLog(@"%@",timeString);
 */

@end
