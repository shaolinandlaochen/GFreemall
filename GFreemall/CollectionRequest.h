//
//  CollectionRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionRequest : NSObject
//获取收藏数据
+(void)ToObtainAListCollectionblock:(void(^)(NSDictionary *dic))block;
@end
