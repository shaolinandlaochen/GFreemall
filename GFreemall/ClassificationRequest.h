//
//  ClassificationRequest.h
//  GFreemall
//
//  Created by 123 on 2017/4/14.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassificationRequest : NSObject
//获取数据
+(void)ForCategoricalData:(void(^)(NSDictionary *dicData))block;
@end
