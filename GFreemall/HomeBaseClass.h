//
//  HomeBaseClass.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeAds;

@interface HomeBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HomeAds *ads;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSArray *recommend;
@property (nonatomic, strong) NSArray *hot;
@property (nonatomic, strong) NSArray *news;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
