//
//  ShoppingSettlementAttr.h
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ShoppingSettlementAttr : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commodityIsPackage;
@property (nonatomic, assign) double commodityWeight;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, strong) NSString *commodityAttributes;
@property (nonatomic, assign) double commodityFreight;
@property (nonatomic, assign) double commodityMarketprice;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *commodityAttributeValues;
@property (nonatomic, strong) NSString *commodityAttributeName;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double categorySerial;
@property (nonatomic, strong) NSString *commoditySend;
@property (nonatomic, assign) double attrIdentifier;
@property (nonatomic, strong) NSString *commodityImages;
@property (nonatomic, assign) double brandSerial;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double commodityId;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, assign) double commodityDiscount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
