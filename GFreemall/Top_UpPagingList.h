//
//  Top_UpPagingList.h
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Top_UpPagingList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double currPage;
@property (nonatomic, assign) double totalRecode;
@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, strong) NSArray *resultList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
