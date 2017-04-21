//
//  GoodsDetailsComm.m
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsComm.h"


NSString *const kGoodsDetailsCommCommoditySerial = @"commodity_serial";
NSString *const kGoodsDetailsCommCommodityWeight = @"commodity_weight";
NSString *const kGoodsDetailsCommCommodityCoverImage = @"commodity_cover_image";
NSString *const kGoodsDetailsCommCommoditySales = @"commodity_sales";
NSString *const kGoodsDetailsCommCommodityDiscount = @"commodity_discount";
NSString *const kGoodsDetailsCommCommodityIsonsales = @"commodity_isonsales";
NSString *const kGoodsDetailsCommCommodityFreight = @"commodity_freight";
NSString *const kGoodsDetailsCommCommodityMarketprice = @"commodity_marketprice";
NSString *const kGoodsDetailsCommCommodityIsrecommend = @"commodity_isrecommend";
NSString *const kGoodsDetailsCommCommodityDigest = @"commodity_digest";
NSString *const kGoodsDetailsCommCommodityShowtime = @"commodity_showtime";
NSString *const kGoodsDetailsCommCommodityAttributeName = @"commodity_attribute_name";
NSString *const kGoodsDetailsCommCommodityGrade = @"commodity_grade";
NSString *const kGoodsDetailsCommCommodityImagesPath = @"commodity_images_path";
NSString *const kGoodsDetailsCommCategorySerial = @"category_serial";
NSString *const kGoodsDetailsCommCommoditySend = @"commodity_send";
NSString *const kGoodsDetailsCommCommodityAttributeValues = @"commodity_attribute_values";
NSString *const kGoodsDetailsCommId = @"id";
NSString *const kGoodsDetailsCommCommodityProarea = @"commodity_proarea";
NSString *const kGoodsDetailsCommCommodityImages = @"commodity_images";
NSString *const kGoodsDetailsCommCommodityAttributeValuesEn = @"commodity_attribute_values_en";
NSString *const kGoodsDetailsCommCommodityManufacturer = @"commodity_manufacturer";
NSString *const kGoodsDetailsCommBrandSerial = @"brand_serial";
NSString *const kGoodsDetailsCommCommoditySellprice = @"commodity_sellprice";
NSString *const kGoodsDetailsCommCommodityIshot = @"commodity_ishot";
NSString *const kGoodsDetailsCommCommodityIsnew = @"commodity_isnew";
NSString *const kGoodsDetailsCommCommodityAttributeNameEn = @"commodity_attribute_name_en";
NSString *const kGoodsDetailsCommCommodityReserves = @"commodity_reserves";
NSString *const kGoodsDetailsCommCommodityLookcount = @"commodity_lookcount";
NSString *const kGoodsDetailsCommCommodityIsPackage = @"commodity_is_package";
NSString *const kGoodsDetailsCommCommodityName = @"commodity_name";
NSString *const kGoodsDetailsCommCommodityDesc = @"commodity_desc";


@interface GoodsDetailsComm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsComm

@synthesize commoditySerial = _commoditySerial;
@synthesize commodityWeight = _commodityWeight;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commoditySales = _commoditySales;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityIsonsales = _commodityIsonsales;
@synthesize commodityFreight = _commodityFreight;
@synthesize commodityMarketprice = _commodityMarketprice;
@synthesize commodityIsrecommend = _commodityIsrecommend;
@synthesize commodityDigest = _commodityDigest;
@synthesize commodityShowtime = _commodityShowtime;
@synthesize commodityAttributeName = _commodityAttributeName;
@synthesize commodityGrade = _commodityGrade;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize categorySerial = _categorySerial;
@synthesize commoditySend = _commoditySend;
@synthesize commodityAttributeValues = _commodityAttributeValues;
@synthesize commIdentifier = _commIdentifier;
@synthesize commodityProarea = _commodityProarea;
@synthesize commodityImages = _commodityImages;
@synthesize commodityAttributeValuesEn = _commodityAttributeValuesEn;
@synthesize commodityManufacturer = _commodityManufacturer;
@synthesize brandSerial = _brandSerial;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityIshot = _commodityIshot;
@synthesize commodityIsnew = _commodityIsnew;
@synthesize commodityAttributeNameEn = _commodityAttributeNameEn;
@synthesize commodityReserves = _commodityReserves;
@synthesize commodityLookcount = _commodityLookcount;
@synthesize commodityIsPackage = _commodityIsPackage;
@synthesize commodityName = _commodityName;
@synthesize commodityDesc = _commodityDesc;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commoditySerial = [[self objectOrNilForKey:kGoodsDetailsCommCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityWeight = [[self objectOrNilForKey:kGoodsDetailsCommCommodityWeight fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kGoodsDetailsCommCommodityCoverImage fromDictionary:dict];
            self.commoditySales = [[self objectOrNilForKey:kGoodsDetailsCommCommoditySales fromDictionary:dict] doubleValue];
            self.commodityDiscount = [[self objectOrNilForKey:kGoodsDetailsCommCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityIsonsales = [[self objectOrNilForKey:kGoodsDetailsCommCommodityIsonsales fromDictionary:dict] doubleValue];
            self.commodityFreight = [[self objectOrNilForKey:kGoodsDetailsCommCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityMarketprice = [[self objectOrNilForKey:kGoodsDetailsCommCommodityMarketprice fromDictionary:dict] doubleValue];
            self.commodityIsrecommend = [[self objectOrNilForKey:kGoodsDetailsCommCommodityIsrecommend fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kGoodsDetailsCommCommodityDigest fromDictionary:dict];
            self.commodityShowtime = [self objectOrNilForKey:kGoodsDetailsCommCommodityShowtime fromDictionary:dict];
            self.commodityAttributeName = [self objectOrNilForKey:kGoodsDetailsCommCommodityAttributeName fromDictionary:dict];
            self.commodityGrade = [[self objectOrNilForKey:kGoodsDetailsCommCommodityGrade fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kGoodsDetailsCommCommodityImagesPath fromDictionary:dict];
            self.categorySerial = [[self objectOrNilForKey:kGoodsDetailsCommCategorySerial fromDictionary:dict] doubleValue];
            self.commoditySend = [self objectOrNilForKey:kGoodsDetailsCommCommoditySend fromDictionary:dict];
            self.commodityAttributeValues = [self objectOrNilForKey:kGoodsDetailsCommCommodityAttributeValues fromDictionary:dict];
            self.commIdentifier = [[self objectOrNilForKey:kGoodsDetailsCommId fromDictionary:dict] doubleValue];
            self.commodityProarea = [self objectOrNilForKey:kGoodsDetailsCommCommodityProarea fromDictionary:dict];
            self.commodityImages = [self objectOrNilForKey:kGoodsDetailsCommCommodityImages fromDictionary:dict];
            self.commodityAttributeValuesEn = [self objectOrNilForKey:kGoodsDetailsCommCommodityAttributeValuesEn fromDictionary:dict];
            self.commodityManufacturer = [self objectOrNilForKey:kGoodsDetailsCommCommodityManufacturer fromDictionary:dict];
            self.brandSerial = [[self objectOrNilForKey:kGoodsDetailsCommBrandSerial fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kGoodsDetailsCommCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityIshot = [[self objectOrNilForKey:kGoodsDetailsCommCommodityIshot fromDictionary:dict] doubleValue];
            self.commodityIsnew = [[self objectOrNilForKey:kGoodsDetailsCommCommodityIsnew fromDictionary:dict] doubleValue];
            self.commodityAttributeNameEn = [self objectOrNilForKey:kGoodsDetailsCommCommodityAttributeNameEn fromDictionary:dict];
            self.commodityReserves = [[self objectOrNilForKey:kGoodsDetailsCommCommodityReserves fromDictionary:dict] doubleValue];
            self.commodityLookcount = [[self objectOrNilForKey:kGoodsDetailsCommCommodityLookcount fromDictionary:dict] doubleValue];
            self.commodityIsPackage = [[self objectOrNilForKey:kGoodsDetailsCommCommodityIsPackage fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kGoodsDetailsCommCommodityName fromDictionary:dict];
            self.commodityDesc = [self objectOrNilForKey:kGoodsDetailsCommCommodityDesc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kGoodsDetailsCommCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityWeight] forKey:kGoodsDetailsCommCommodityWeight];
    [mutableDict setValue:self.commodityCoverImage forKey:kGoodsDetailsCommCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kGoodsDetailsCommCommoditySales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kGoodsDetailsCommCommodityDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsonsales] forKey:kGoodsDetailsCommCommodityIsonsales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kGoodsDetailsCommCommodityFreight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kGoodsDetailsCommCommodityMarketprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsrecommend] forKey:kGoodsDetailsCommCommodityIsrecommend];
    [mutableDict setValue:self.commodityDigest forKey:kGoodsDetailsCommCommodityDigest];
    [mutableDict setValue:self.commodityShowtime forKey:kGoodsDetailsCommCommodityShowtime];
    [mutableDict setValue:self.commodityAttributeName forKey:kGoodsDetailsCommCommodityAttributeName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityGrade] forKey:kGoodsDetailsCommCommodityGrade];
    [mutableDict setValue:self.commodityImagesPath forKey:kGoodsDetailsCommCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kGoodsDetailsCommCategorySerial];
    [mutableDict setValue:self.commoditySend forKey:kGoodsDetailsCommCommoditySend];
    [mutableDict setValue:self.commodityAttributeValues forKey:kGoodsDetailsCommCommodityAttributeValues];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commIdentifier] forKey:kGoodsDetailsCommId];
    [mutableDict setValue:self.commodityProarea forKey:kGoodsDetailsCommCommodityProarea];
    [mutableDict setValue:self.commodityImages forKey:kGoodsDetailsCommCommodityImages];
    [mutableDict setValue:self.commodityAttributeValuesEn forKey:kGoodsDetailsCommCommodityAttributeValuesEn];
    [mutableDict setValue:self.commodityManufacturer forKey:kGoodsDetailsCommCommodityManufacturer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSerial] forKey:kGoodsDetailsCommBrandSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kGoodsDetailsCommCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIshot] forKey:kGoodsDetailsCommCommodityIshot];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsnew] forKey:kGoodsDetailsCommCommodityIsnew];
    [mutableDict setValue:self.commodityAttributeNameEn forKey:kGoodsDetailsCommCommodityAttributeNameEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kGoodsDetailsCommCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityLookcount] forKey:kGoodsDetailsCommCommodityLookcount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsPackage] forKey:kGoodsDetailsCommCommodityIsPackage];
    [mutableDict setValue:self.commodityName forKey:kGoodsDetailsCommCommodityName];
    [mutableDict setValue:self.commodityDesc forKey:kGoodsDetailsCommCommodityDesc];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.commoditySerial = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommoditySerial];
    self.commodityWeight = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityWeight];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityCoverImage];
    self.commoditySales = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommoditySales];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityDiscount];
    self.commodityIsonsales = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityIsonsales];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityFreight];
    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityMarketprice];
    self.commodityIsrecommend = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityIsrecommend];
    self.commodityDigest = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityDigest];
    self.commodityShowtime = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityShowtime];
    self.commodityAttributeName = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityAttributeName];
    self.commodityGrade = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityGrade];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityImagesPath];
    self.categorySerial = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCategorySerial];
    self.commoditySend = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommoditySend];
    self.commodityAttributeValues = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityAttributeValues];
    self.commIdentifier = [aDecoder decodeDoubleForKey:kGoodsDetailsCommId];
    self.commodityProarea = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityProarea];
    self.commodityImages = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityImages];
    self.commodityAttributeValuesEn = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityAttributeValuesEn];
    self.commodityManufacturer = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityManufacturer];
    self.brandSerial = [aDecoder decodeDoubleForKey:kGoodsDetailsCommBrandSerial];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommoditySellprice];
    self.commodityIshot = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityIshot];
    self.commodityIsnew = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityIsnew];
    self.commodityAttributeNameEn = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityAttributeNameEn];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityReserves];
    self.commodityLookcount = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityLookcount];
    self.commodityIsPackage = [aDecoder decodeDoubleForKey:kGoodsDetailsCommCommodityIsPackage];
    self.commodityName = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityName];
    self.commodityDesc = [aDecoder decodeObjectForKey:kGoodsDetailsCommCommodityDesc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySerial forKey:kGoodsDetailsCommCommoditySerial];
    [aCoder encodeDouble:_commodityWeight forKey:kGoodsDetailsCommCommodityWeight];
    [aCoder encodeObject:_commodityCoverImage forKey:kGoodsDetailsCommCommodityCoverImage];
    [aCoder encodeDouble:_commoditySales forKey:kGoodsDetailsCommCommoditySales];
    [aCoder encodeDouble:_commodityDiscount forKey:kGoodsDetailsCommCommodityDiscount];
    [aCoder encodeDouble:_commodityIsonsales forKey:kGoodsDetailsCommCommodityIsonsales];
    [aCoder encodeDouble:_commodityFreight forKey:kGoodsDetailsCommCommodityFreight];
    [aCoder encodeDouble:_commodityMarketprice forKey:kGoodsDetailsCommCommodityMarketprice];
    [aCoder encodeDouble:_commodityIsrecommend forKey:kGoodsDetailsCommCommodityIsrecommend];
    [aCoder encodeObject:_commodityDigest forKey:kGoodsDetailsCommCommodityDigest];
    [aCoder encodeObject:_commodityShowtime forKey:kGoodsDetailsCommCommodityShowtime];
    [aCoder encodeObject:_commodityAttributeName forKey:kGoodsDetailsCommCommodityAttributeName];
    [aCoder encodeDouble:_commodityGrade forKey:kGoodsDetailsCommCommodityGrade];
    [aCoder encodeObject:_commodityImagesPath forKey:kGoodsDetailsCommCommodityImagesPath];
    [aCoder encodeDouble:_categorySerial forKey:kGoodsDetailsCommCategorySerial];
    [aCoder encodeObject:_commoditySend forKey:kGoodsDetailsCommCommoditySend];
    [aCoder encodeObject:_commodityAttributeValues forKey:kGoodsDetailsCommCommodityAttributeValues];
    [aCoder encodeDouble:_commIdentifier forKey:kGoodsDetailsCommId];
    [aCoder encodeObject:_commodityProarea forKey:kGoodsDetailsCommCommodityProarea];
    [aCoder encodeObject:_commodityImages forKey:kGoodsDetailsCommCommodityImages];
    [aCoder encodeObject:_commodityAttributeValuesEn forKey:kGoodsDetailsCommCommodityAttributeValuesEn];
    [aCoder encodeObject:_commodityManufacturer forKey:kGoodsDetailsCommCommodityManufacturer];
    [aCoder encodeDouble:_brandSerial forKey:kGoodsDetailsCommBrandSerial];
    [aCoder encodeDouble:_commoditySellprice forKey:kGoodsDetailsCommCommoditySellprice];
    [aCoder encodeDouble:_commodityIshot forKey:kGoodsDetailsCommCommodityIshot];
    [aCoder encodeDouble:_commodityIsnew forKey:kGoodsDetailsCommCommodityIsnew];
    [aCoder encodeObject:_commodityAttributeNameEn forKey:kGoodsDetailsCommCommodityAttributeNameEn];
    [aCoder encodeDouble:_commodityReserves forKey:kGoodsDetailsCommCommodityReserves];
    [aCoder encodeDouble:_commodityLookcount forKey:kGoodsDetailsCommCommodityLookcount];
    [aCoder encodeDouble:_commodityIsPackage forKey:kGoodsDetailsCommCommodityIsPackage];
    [aCoder encodeObject:_commodityName forKey:kGoodsDetailsCommCommodityName];
    [aCoder encodeObject:_commodityDesc forKey:kGoodsDetailsCommCommodityDesc];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetailsComm *copy = [[GoodsDetailsComm alloc] init];
    
    
    
    if (copy) {

        copy.commoditySerial = self.commoditySerial;
        copy.commodityWeight = self.commodityWeight;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commoditySales = self.commoditySales;
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityIsonsales = self.commodityIsonsales;
        copy.commodityFreight = self.commodityFreight;
        copy.commodityMarketprice = self.commodityMarketprice;
        copy.commodityIsrecommend = self.commodityIsrecommend;
        copy.commodityDigest = [self.commodityDigest copyWithZone:zone];
        copy.commodityShowtime = [self.commodityShowtime copyWithZone:zone];
        copy.commodityAttributeName = [self.commodityAttributeName copyWithZone:zone];
        copy.commodityGrade = self.commodityGrade;
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.categorySerial = self.categorySerial;
        copy.commoditySend = [self.commoditySend copyWithZone:zone];
        copy.commodityAttributeValues = [self.commodityAttributeValues copyWithZone:zone];
        copy.commIdentifier = self.commIdentifier;
        copy.commodityProarea = [self.commodityProarea copyWithZone:zone];
        copy.commodityImages = [self.commodityImages copyWithZone:zone];
        copy.commodityAttributeValuesEn = [self.commodityAttributeValuesEn copyWithZone:zone];
        copy.commodityManufacturer = [self.commodityManufacturer copyWithZone:zone];
        copy.brandSerial = self.brandSerial;
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityIshot = self.commodityIshot;
        copy.commodityIsnew = self.commodityIsnew;
        copy.commodityAttributeNameEn = [self.commodityAttributeNameEn copyWithZone:zone];
        copy.commodityReserves = self.commodityReserves;
        copy.commodityLookcount = self.commodityLookcount;
        copy.commodityIsPackage = self.commodityIsPackage;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityDesc = [self.commodityDesc copyWithZone:zone];
    }
    
    return copy;
}


@end
