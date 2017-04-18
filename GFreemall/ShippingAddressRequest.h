//
//  ShippingAddressRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShippingAddressRequest : NSObject
///获取收货地址列表
+(void)ToObtainAListShippingAddressblock:(void(^)(NSDictionary *dics))bloock;
@end
