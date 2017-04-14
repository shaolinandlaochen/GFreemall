//
//  LoginRequuestClass.h
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequuestClass : NSObject
//登录
+(void)LoginUsername:(NSString *)username password:(NSString *)password block:(void(^)(NSDictionary *dic))block;
@end
