//
//  OrderListBaseClass.h
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrderListPagingList;

@interface OrderListBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double noReceiving;
@property (nonatomic, assign) double isComment;
@property (nonatomic, assign) double noPay;
@property (nonatomic, strong) OrderListPagingList *pagingList;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
