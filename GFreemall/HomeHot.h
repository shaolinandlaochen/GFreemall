//
//  HomeHot.h
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeHot : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *commodityDigestTw;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityDigestEn;
@property (nonatomic, strong) NSString *commodityNameTw;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, strong) NSString *commodityNameEn;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *commodityDigest;
@property (nonatomic, strong) NSString *commodityCoverImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
