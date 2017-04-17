//
//  MyRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRequest : NSObject
//获取我的个人信息
+(void)PersonalInformationbblock:(void(^)(NSDictionary *dics))block;
@end
