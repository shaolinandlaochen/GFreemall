//
//  Top_UpBaseClass.h
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Top_UpPagingList;

@interface Top_UpBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) Top_UpPagingList *pagingList;
@property (nonatomic, strong) NSString *start;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
