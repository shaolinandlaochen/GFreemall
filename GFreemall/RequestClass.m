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
         [SVProgressHUD dismiss];
    }];
    [task resume];
    
}
//get请求
+(void)getUrl:(NSString *)urlStr Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block{
    
    
    
    //创建串行队列
    dispatch_queue_t  queue= dispatch_queue_create("wendingding", NULL);
    //第一个参数为串行队列的名称，是c语言的字符串
    //第二个参数为队列的属性，一般来说串行队列不需要赋值任何属性，所以通常传空值（NULL）
    //2.添加任务到队列中执行
    
    dispatch_async(queue, ^{
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
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新，
                 block(Dictionary);
            });
           
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"****get请求%@",error);
            [SVProgressHUD dismiss];
        }];
        [task resume];
        
    });
    
    
 

}
//get请求
+(void)getAddressUrl:(NSString *)urlStr Dic:(NSDictionary *)dic block:(void(^)(NSDictionary *dic))block{

    //创建串行队列
    dispatch_queue_t  queue= dispatch_queue_create("wendingding", NULL);
    //第一个参数为串行队列的名称，是c语言的字符串
    //第二个参数为队列的属性，一般来说串行队列不需要赋值任何属性，所以通常传空值（NULL）
    //2.添加任务到队列中执行
    
    
    
    NSString *string= [TheParentClass SimpleSorting:dic];//请求数据排序
    NSString *RequestUrlString=[NSString stringWithFormat:@"%@%@?&%@",RequestUrl,urlStr,string];
    NSLog(@"请求URL==%@",RequestUrlString);
    
    dispatch_async(queue, ^{
        NSString *RequestUrlString=[NSString stringWithFormat:@"%@%@?",RequestUrl,urlStr];//将签名和请求数据以及端口号拼接亲来形成get请求
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = securityPolicy;
        manager.responseSerializer =[AFHTTPResponseSerializer serializer];
        
      
        NSURLSessionDataTask *task=[manager GET:RequestUrlString parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *Dictionary=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新，
                block(Dictionary);
            });
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"****get请求%@",error);
             [SVProgressHUD dismiss];
        }];
        [task resume];
        
    });
}


/*
 //时间戳
 NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
 NSTimeInterval a=[dat timeIntervalSince1970]*1000;
 NSString *timeString = [NSString stringWithFormat:@"%f", a];
 NSLog(@"%@",timeString);
 */

@end
