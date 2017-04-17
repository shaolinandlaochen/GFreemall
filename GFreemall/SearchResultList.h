//
//  SearchResultList.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SearchResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityDigest;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, assign) double commodityLookcount;
@property (nonatomic, strong) NSString *commodityNameTw;
@property (nonatomic, strong) NSString *commodityDigestTw;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *commodityDigestEn;
@property (nonatomic, strong) NSString *commodityNameEn;
@property (nonatomic, assign) double commodityGrade;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
