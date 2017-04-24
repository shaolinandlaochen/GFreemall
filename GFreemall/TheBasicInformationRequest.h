//
//  TheBasicInformationRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/24.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheBasicInformationRequest : NSObject
//实名认证
+(void)Real_NameAuthenticationName:(NSString *)name idcard:(NSString *)idcard block:(void(^)(NSDictionary *disa))block;
@end
