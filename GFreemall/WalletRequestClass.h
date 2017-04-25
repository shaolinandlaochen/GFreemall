//
//  WalletRequestClass.h
//  GFreemall
//
//  Created by 123 on 2017/4/25.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalletRequestClass : NSObject
//钱包余额查询
+(void)walletBalanceQueryblock:(void(^)(NSDictionary *dic))block;
@end
