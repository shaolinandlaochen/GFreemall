//
//  OrderDetailsRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/24.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderDetailsRequest : NSObject
//获取订单详情
+(void)OrderDetails:(NSString *)serial block:(void(^)(NSDictionary *dics))block;
@end
