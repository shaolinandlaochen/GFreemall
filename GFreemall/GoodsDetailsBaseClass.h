//
//  GoodsDetailsBaseClass.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GoodsDetailsComm, GoodsDetailsMap;

@interface GoodsDetailsBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GoodsDetailsComm *comm;
@property (nonatomic, assign) double totalCount;
@property (nonatomic, strong) NSArray *listPic;
@property (nonatomic, strong) GoodsDetailsMap *map;
@property (nonatomic, assign) double serial;
@property (nonatomic, assign) double commonlyCount;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSArray *listAttribute;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *checkRes;
@property (nonatomic, assign) double size;
@property (nonatomic, assign) BOOL isCollect;
@property (nonatomic, assign) double badCount;
@property (nonatomic, assign) double goodCount;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray *listComment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
