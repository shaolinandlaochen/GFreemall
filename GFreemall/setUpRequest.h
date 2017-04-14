//
//  setUpRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface setUpRequest : NSObject
+(void)feedback:(NSString *)message block:(void(^)(NSDictionary *dicDatas))block;//意见反馈
@end
