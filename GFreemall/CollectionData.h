//
//  CollectionData.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CollectionData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double currPage;
@property (nonatomic, assign) double totalRecode;
@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, strong) NSArray *resultList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
