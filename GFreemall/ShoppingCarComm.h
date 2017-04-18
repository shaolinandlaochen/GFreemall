//
//  ShoppingCarComm.h
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ShoppingCarComm : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commodityLookcount;
@property (nonatomic, assign) double commodityWeight;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, assign) double commoditySales;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *commodityDesc;
@property (nonatomic, assign) double commodityFreight;
@property (nonatomic, assign) double commodityMarketprice;
@property (nonatomic, assign) double commodityIsrecommend;
@property (nonatomic, strong) NSString *commodityDigest;
@property (nonatomic, strong) NSString *commodityShowtime;
@property (nonatomic, strong) NSString *commodityAttributeName;
@property (nonatomic, assign) double commodityGrade;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double categorySerial;
@property (nonatomic, strong) NSString *commoditySend;
@property (nonatomic, strong) NSString *commodityAttributeValues;
@property (nonatomic, assign) double commIdentifier;
@property (nonatomic, strong) NSString *commodityProarea;
@property (nonatomic, strong) NSString *commodityImages;
@property (nonatomic, strong) NSString *commodityAttributeValuesEn;
@property (nonatomic, strong) NSString *commodityManufacturer;
@property (nonatomic, assign) double brandSerial;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, assign) double commodityIshot;
@property (nonatomic, assign) double commodityIsnew;
@property (nonatomic, strong) NSString *commodityAttributeNameEn;
@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double commodityIsPackage;
@property (nonatomic, assign) double commodityDiscount;
@property (nonatomic, assign) double commodityIsonsales;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
