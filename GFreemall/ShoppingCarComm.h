//
//  ShoppingCarComm.h
//
//  Created by   on 2017/5/4
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ShoppingCarComm : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double brandSerial;
@property (nonatomic, assign) double commodityIsrecommend;
@property (nonatomic, assign) double commodityIsPackage;
@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double commIdentifier;
@property (nonatomic, assign) double commodityIshot;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double commodityDiscount;
@property (nonatomic, assign) double commodityWeight;
@property (nonatomic, assign) double commodityIsnew;
@property (nonatomic, assign) double commodityMarketprice;
@property (nonatomic, strong) NSString *commodityAttributeValues;
@property (nonatomic, assign) double commodityIsonsales;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *commodityDesc;
@property (nonatomic, strong) NSString *commodityAttributeName;
@property (nonatomic, strong) NSString *commodityManufacturer;
@property (nonatomic, strong) NSString *commodityProarea;
@property (nonatomic, strong) NSString *commodityShowtime;
@property (nonatomic, assign) double commodityFreight;
@property (nonatomic, strong) NSString *commodityAttributeNameEn;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, strong) NSString *commodityImages;
@property (nonatomic, strong) NSString *commodityDigest;
@property (nonatomic, strong) NSString *commoditySend;
@property (nonatomic, assign) double amountTotal;
@property (nonatomic, strong) NSString *commodityAttributeValuesEn;
@property (nonatomic, assign) double commodityLookcount;
@property (nonatomic, strong) NSString *commodityAttributes;
@property (nonatomic, assign) double commodityGrade;
@property (nonatomic, assign) double commoditySales;
@property (nonatomic, assign) double categorySerial;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
