//
//  MessageRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/17.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageRequest : NSObject
//获取消息列表
+(void)AccessToTheMessageListBlock:(void(^)(NSDictionary *dics))block;
//获取消息详情
+(void)GetNewsDetailsmessage_id:(int)message_id Block:(void(^)(NSDictionary *dics))block;
@end
