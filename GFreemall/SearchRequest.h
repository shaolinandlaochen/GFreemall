//
//  SearchRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchRequest : NSObject
//获取搜索数据
+(void)AccessToSearchData:(NSString *)string page:(NSString *)page pageSize:(NSString *)pageSize queryType:(NSString *)queryType  priceType:(NSString *)priceType brandSerial:(NSString *)brandSerial categorySerial:(NSString *)categorySerial bolck:(void(^)(NSDictionary *dic))bolck;
@end
