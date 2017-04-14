//
//  ForCategoricalDataListCategory.h
//
//  Created by   on 2017/4/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ForCategoricalDataListCategory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double categoryPid;
@property (nonatomic, strong) NSArray *secondNav;
@property (nonatomic, strong) NSString *categoryNameEn;
@property (nonatomic, strong) NSString *categoryNameTw;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityDigest;
@property (nonatomic, strong) NSArray *recommendBrands;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, assign) double categorySerial;
@property (nonatomic, assign) double categorySort;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *commodityNameEn;
@property (nonatomic, strong) NSString *commodityNameTw;
@property (nonatomic, strong) NSString *commodityDigestEn;
@property (nonatomic, strong) NSString *commodityDigestTw;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
