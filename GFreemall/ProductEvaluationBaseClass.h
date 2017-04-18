//
//  ProductEvaluationBaseClass.h
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProductEvaluationListComment;

@interface ProductEvaluationBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, assign) double goodCount;
@property (nonatomic, assign) double totalCount;
@property (nonatomic, strong) ProductEvaluationListComment *listComment;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double badCount;
@property (nonatomic, assign) double commonlyCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
