//
//  MyBaseClass.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyInfo;

@interface MyBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) MyInfo *info;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
