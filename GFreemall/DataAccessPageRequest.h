//
//  DataAccessPageRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccessPageRequest : NSObject
//获取首页数据
+(void)DataAccessPageRequestBlock:(void(^)(NSDictionary *dics))block;
//获取未读消息数量
+(void)GetNumbeOfUnreadMessagesBlock:(void(^)(NSDictionary *dics))block;
@end
