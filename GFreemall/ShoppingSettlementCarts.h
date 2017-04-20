//
//  ShoppingSettlementCarts.h
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ShoppingSettlementCarts : NSObject <NSCoding, NSCopying>

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
@property (nonatomic, assign) double cartsIdentifier;
@property (nonatomic, strong) NSString *commodityImages;
@property (nonatomic, assign) double brandSerial;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double commodityId;
@property (nonatomic, assign) double commodityDiscount;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, assign) double commodityIsPackage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
