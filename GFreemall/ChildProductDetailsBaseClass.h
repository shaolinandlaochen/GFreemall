//
//  ChildProductDetailsBaseClass.h
//
//  Created by   on 2017/4/28
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChildProductDetailsMap;

@interface ChildProductDetailsBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ChildProductDetailsMap *map;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
