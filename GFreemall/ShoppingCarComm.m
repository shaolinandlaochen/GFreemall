//
//  ShoppingCarComm.m
//
//  Created by   on 2017/5/4
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingCarComm.h"


NSString *const kShoppingCarCommBrandSerial = @"brand_serial";
NSString *const kShoppingCarCommCommodityIsrecommend = @"commodity_isrecommend";
NSString *const kShoppingCarCommCommodityIsPackage = @"commodity_is_package";
NSString *const kShoppingCarCommCommodityReserves = @"commodity_reserves";
NSString *const kShoppingCarCommId = @"id";
NSString *const kShoppingCarCommCommodityIshot = @"commodity_ishot";
NSString *const kShoppingCarCommCommoditySerial = @"commodity_serial";
NSString *const kShoppingCarCommCommodityDiscount = @"commodity_discount";
NSString *const kShoppingCarCommCommodityWeight = @"commodity_weight";
NSString *const kShoppingCarCommCommodityIsnew = @"commodity_isnew";
NSString *const kShoppingCarCommCommodityMarketprice = @"commodity_marketprice";
NSString *const kShoppingCarCommCommodityAttributeValues = @"commodity_attribute_values";
NSString *const kShoppingCarCommCommodityIsonsales = @"commodity_isonsales";
NSString *const kShoppingCarCommCommodityImagesPath = @"commodity_images_path";
NSString *const kShoppingCarCommCommoditySellprice = @"commodity_sellprice";
NSString *const kShoppingCarCommCommodityDesc = @"commodity_desc";
NSString *const kShoppingCarCommCommodityAttributeName = @"commodity_attribute_name";
NSString *const kShoppingCarCommCommodityManufacturer = @"commodity_manufacturer";
NSString *const kShoppingCarCommCommodityProarea = @"commodity_proarea";
NSString *const kShoppingCarCommCommodityShowtime = @"commodity_showtime";
NSString *const kShoppingCarCommCommodityFreight = @"commodity_freight";
NSString *const kShoppingCarCommCommodityAttributeNameEn = @"commodity_attribute_name_en";
NSString *const kShoppingCarCommCommodityName = @"commodity_name";
NSString *const kShoppingCarCommCommodityCoverImage = @"commodity_cover_image";
NSString *const kShoppingCarCommCommodityImages = @"commodity_images";
NSString *const kShoppingCarCommCommodityDigest = @"commodity_digest";
NSString *const kShoppingCarCommCommoditySend = @"commodity_send";
NSString *const kShoppingCarCommAmountTotal = @"amountTotal";
NSString *const kShoppingCarCommCommodityAttributeValuesEn = @"commodity_attribute_values_en";
NSString *const kShoppingCarCommCommodityLookcount = @"commodity_lookcount";
NSString *const kShoppingCarCommCommodityAttributes = @"commodity_attributes";
NSString *const kShoppingCarCommCommodityGrade = @"commodity_grade";
NSString *const kShoppingCarCommCommoditySales = @"commodity_sales";
NSString *const kShoppingCarCommCategorySerial = @"category_serial";


@interface ShoppingCarComm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingCarComm

@synthesize brandSerial = _brandSerial;
@synthesize commodityIsrecommend = _commodityIsrecommend;
@synthesize commodityIsPackage = _commodityIsPackage;
@synthesize commodityReserves = _commodityReserves;
@synthesize commIdentifier = _commIdentifier;
@synthesize commodityIshot = _commodityIshot;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityWeight = _commodityWeight;
@synthesize commodityIsnew = _commodityIsnew;
@synthesize commodityMarketprice = _commodityMarketprice;
@synthesize commodityAttributeValues = _commodityAttributeValues;
@synthesize commodityIsonsales = _commodityIsonsales;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityDesc = _commodityDesc;
@synthesize commodityAttributeName = _commodityAttributeName;
@synthesize commodityManufacturer = _commodityManufacturer;
@synthesize commodityProarea = _commodityProarea;
@synthesize commodityShowtime = _commodityShowtime;
@synthesize commodityFreight = _commodityFreight;
@synthesize commodityAttributeNameEn = _commodityAttributeNameEn;
@synthesize commodityName = _commodityName;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commodityImages = _commodityImages;
@synthesize commodityDigest = _commodityDigest;
@synthesize commoditySend = _commoditySend;
@synthesize amountTotal = _amountTotal;
@synthesize commodityAttributeValuesEn = _commodityAttributeValuesEn;
@synthesize commodityLookcount = _commodityLookcount;
@synthesize commodityAttributes = _commodityAttributes;
@synthesize commodityGrade = _commodityGrade;
@synthesize commoditySales = _commoditySales;
@synthesize categorySerial = _categorySerial;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.brandSerial = [[self objectOrNilForKey:kShoppingCarCommBrandSerial fromDictionary:dict] doubleValue];
            self.commodityIsrecommend = [[self objectOrNilForKey:kShoppingCarCommCommodityIsrecommend fromDictionary:dict] doubleValue];
            self.commodityIsPackage = [[self objectOrNilForKey:kShoppingCarCommCommodityIsPackage fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kShoppingCarCommCommodityReserves fromDictionary:dict] doubleValue];
            self.commIdentifier = [[self objectOrNilForKey:kShoppingCarCommId fromDictionary:dict] doubleValue];
            self.commodityIshot = [[self objectOrNilForKey:kShoppingCarCommCommodityIshot fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kShoppingCarCommCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityDiscount = [[self objectOrNilForKey:kShoppingCarCommCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityWeight = [[self objectOrNilForKey:kShoppingCarCommCommodityWeight fromDictionary:dict] doubleValue];
            self.commodityIsnew = [[self objectOrNilForKey:kShoppingCarCommCommodityIsnew fromDictionary:dict] doubleValue];
            self.commodityMarketprice = [[self objectOrNilForKey:kShoppingCarCommCommodityMarketprice fromDictionary:dict] doubleValue];
            self.commodityAttributeValues = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeValues fromDictionary:dict];
            self.commodityIsonsales = [[self objectOrNilForKey:kShoppingCarCommCommodityIsonsales fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kShoppingCarCommCommodityImagesPath fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kShoppingCarCommCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityDesc = [self objectOrNilForKey:kShoppingCarCommCommodityDesc fromDictionary:dict];
            self.commodityAttributeName = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeName fromDictionary:dict];
            self.commodityManufacturer = [self objectOrNilForKey:kShoppingCarCommCommodityManufacturer fromDictionary:dict];
            self.commodityProarea = [self objectOrNilForKey:kShoppingCarCommCommodityProarea fromDictionary:dict];
            self.commodityShowtime = [self objectOrNilForKey:kShoppingCarCommCommodityShowtime fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kShoppingCarCommCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityAttributeNameEn = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeNameEn fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kShoppingCarCommCommodityName fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kShoppingCarCommCommodityCoverImage fromDictionary:dict];
            self.commodityImages = [self objectOrNilForKey:kShoppingCarCommCommodityImages fromDictionary:dict];
            self.commodityDigest = [self objectOrNilForKey:kShoppingCarCommCommodityDigest fromDictionary:dict];
            self.commoditySend = [self objectOrNilForKey:kShoppingCarCommCommoditySend fromDictionary:dict];
            self.amountTotal = [[self objectOrNilForKey:kShoppingCarCommAmountTotal fromDictionary:dict] doubleValue];
            self.commodityAttributeValuesEn = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeValuesEn fromDictionary:dict];
            self.commodityLookcount = [[self objectOrNilForKey:kShoppingCarCommCommodityLookcount fromDictionary:dict] doubleValue];
            self.commodityAttributes = [self objectOrNilForKey:kShoppingCarCommCommodityAttributes fromDictionary:dict];
            self.commodityGrade = [[self objectOrNilForKey:kShoppingCarCommCommodityGrade fromDictionary:dict] doubleValue];
            self.commoditySales = [[self objectOrNilForKey:kShoppingCarCommCommoditySales fromDictionary:dict] doubleValue];
            self.categorySerial = [[self objectOrNilForKey:kShoppingCarCommCategorySerial fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSerial] forKey:kShoppingCarCommBrandSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsrecommend] forKey:kShoppingCarCommCommodityIsrecommend];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsPackage] forKey:kShoppingCarCommCommodityIsPackage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kShoppingCarCommCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commIdentifier] forKey:kShoppingCarCommId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIshot] forKey:kShoppingCarCommCommodityIshot];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kShoppingCarCommCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kShoppingCarCommCommodityDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityWeight] forKey:kShoppingCarCommCommodityWeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsnew] forKey:kShoppingCarCommCommodityIsnew];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kShoppingCarCommCommodityMarketprice];
    [mutableDict setValue:self.commodityAttributeValues forKey:kShoppingCarCommCommodityAttributeValues];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsonsales] forKey:kShoppingCarCommCommodityIsonsales];
    [mutableDict setValue:self.commodityImagesPath forKey:kShoppingCarCommCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kShoppingCarCommCommoditySellprice];
    [mutableDict setValue:self.commodityDesc forKey:kShoppingCarCommCommodityDesc];
    [mutableDict setValue:self.commodityAttributeName forKey:kShoppingCarCommCommodityAttributeName];
    [mutableDict setValue:self.commodityManufacturer forKey:kShoppingCarCommCommodityManufacturer];
    [mutableDict setValue:self.commodityProarea forKey:kShoppingCarCommCommodityProarea];
    [mutableDict setValue:self.commodityShowtime forKey:kShoppingCarCommCommodityShowtime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kShoppingCarCommCommodityFreight];
    [mutableDict setValue:self.commodityAttributeNameEn forKey:kShoppingCarCommCommodityAttributeNameEn];
    [mutableDict setValue:self.commodityName forKey:kShoppingCarCommCommodityName];
    [mutableDict setValue:self.commodityCoverImage forKey:kShoppingCarCommCommodityCoverImage];
    [mutableDict setValue:self.commodityImages forKey:kShoppingCarCommCommodityImages];
    [mutableDict setValue:self.commodityDigest forKey:kShoppingCarCommCommodityDigest];
    [mutableDict setValue:self.commoditySend forKey:kShoppingCarCommCommoditySend];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amountTotal] forKey:kShoppingCarCommAmountTotal];
    [mutableDict setValue:self.commodityAttributeValuesEn forKey:kShoppingCarCommCommodityAttributeValuesEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityLookcount] forKey:kShoppingCarCommCommodityLookcount];
    [mutableDict setValue:self.commodityAttributes forKey:kShoppingCarCommCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityGrade] forKey:kShoppingCarCommCommodityGrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kShoppingCarCommCommoditySales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kShoppingCarCommCategorySerial];

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

    self.brandSerial = [aDecoder decodeDoubleForKey:kShoppingCarCommBrandSerial];
    self.commodityIsrecommend = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsrecommend];
    self.commodityIsPackage = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsPackage];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityReserves];
    self.commIdentifier = [aDecoder decodeDoubleForKey:kShoppingCarCommId];
    self.commodityIshot = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIshot];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kShoppingCarCommCommoditySerial];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityDiscount];
    self.commodityWeight = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityWeight];
    self.commodityIsnew = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsnew];
    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityMarketprice];
    self.commodityAttributeValues = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeValues];
    self.commodityIsonsales = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsonsales];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityImagesPath];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kShoppingCarCommCommoditySellprice];
    self.commodityDesc = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityDesc];
    self.commodityAttributeName = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeName];
    self.commodityManufacturer = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityManufacturer];
    self.commodityProarea = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityProarea];
    self.commodityShowtime = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityShowtime];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityFreight];
    self.commodityAttributeNameEn = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeNameEn];
    self.commodityName = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityName];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityCoverImage];
    self.commodityImages = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityImages];
    self.commodityDigest = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityDigest];
    self.commoditySend = [aDecoder decodeObjectForKey:kShoppingCarCommCommoditySend];
    self.amountTotal = [aDecoder decodeDoubleForKey:kShoppingCarCommAmountTotal];
    self.commodityAttributeValuesEn = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeValuesEn];
    self.commodityLookcount = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityLookcount];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributes];
    self.commodityGrade = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityGrade];
    self.commoditySales = [aDecoder decodeDoubleForKey:kShoppingCarCommCommoditySales];
    self.categorySerial = [aDecoder decodeDoubleForKey:kShoppingCarCommCategorySerial];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_brandSerial forKey:kShoppingCarCommBrandSerial];
    [aCoder encodeDouble:_commodityIsrecommend forKey:kShoppingCarCommCommodityIsrecommend];
    [aCoder encodeDouble:_commodityIsPackage forKey:kShoppingCarCommCommodityIsPackage];
    [aCoder encodeDouble:_commodityReserves forKey:kShoppingCarCommCommodityReserves];
    [aCoder encodeDouble:_commIdentifier forKey:kShoppingCarCommId];
    [aCoder encodeDouble:_commodityIshot forKey:kShoppingCarCommCommodityIshot];
    [aCoder encodeDouble:_commoditySerial forKey:kShoppingCarCommCommoditySerial];
    [aCoder encodeDouble:_commodityDiscount forKey:kShoppingCarCommCommodityDiscount];
    [aCoder encodeDouble:_commodityWeight forKey:kShoppingCarCommCommodityWeight];
    [aCoder encodeDouble:_commodityIsnew forKey:kShoppingCarCommCommodityIsnew];
    [aCoder encodeDouble:_commodityMarketprice forKey:kShoppingCarCommCommodityMarketprice];
    [aCoder encodeObject:_commodityAttributeValues forKey:kShoppingCarCommCommodityAttributeValues];
    [aCoder encodeDouble:_commodityIsonsales forKey:kShoppingCarCommCommodityIsonsales];
    [aCoder encodeObject:_commodityImagesPath forKey:kShoppingCarCommCommodityImagesPath];
    [aCoder encodeDouble:_commoditySellprice forKey:kShoppingCarCommCommoditySellprice];
    [aCoder encodeObject:_commodityDesc forKey:kShoppingCarCommCommodityDesc];
    [aCoder encodeObject:_commodityAttributeName forKey:kShoppingCarCommCommodityAttributeName];
    [aCoder encodeObject:_commodityManufacturer forKey:kShoppingCarCommCommodityManufacturer];
    [aCoder encodeObject:_commodityProarea forKey:kShoppingCarCommCommodityProarea];
    [aCoder encodeObject:_commodityShowtime forKey:kShoppingCarCommCommodityShowtime];
    [aCoder encodeDouble:_commodityFreight forKey:kShoppingCarCommCommodityFreight];
    [aCoder encodeObject:_commodityAttributeNameEn forKey:kShoppingCarCommCommodityAttributeNameEn];
    [aCoder encodeObject:_commodityName forKey:kShoppingCarCommCommodityName];
    [aCoder encodeObject:_commodityCoverImage forKey:kShoppingCarCommCommodityCoverImage];
    [aCoder encodeObject:_commodityImages forKey:kShoppingCarCommCommodityImages];
    [aCoder encodeObject:_commodityDigest forKey:kShoppingCarCommCommodityDigest];
    [aCoder encodeObject:_commoditySend forKey:kShoppingCarCommCommoditySend];
    [aCoder encodeDouble:_amountTotal forKey:kShoppingCarCommAmountTotal];
    [aCoder encodeObject:_commodityAttributeValuesEn forKey:kShoppingCarCommCommodityAttributeValuesEn];
    [aCoder encodeDouble:_commodityLookcount forKey:kShoppingCarCommCommodityLookcount];
    [aCoder encodeObject:_commodityAttributes forKey:kShoppingCarCommCommodityAttributes];
    [aCoder encodeDouble:_commodityGrade forKey:kShoppingCarCommCommodityGrade];
    [aCoder encodeDouble:_commoditySales forKey:kShoppingCarCommCommoditySales];
    [aCoder encodeDouble:_categorySerial forKey:kShoppingCarCommCategorySerial];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingCarComm *copy = [[ShoppingCarComm alloc] init];
    
    
    
    if (copy) {

        copy.brandSerial = self.brandSerial;
        copy.commodityIsrecommend = self.commodityIsrecommend;
        copy.commodityIsPackage = self.commodityIsPackage;
        copy.commodityReserves = self.commodityReserves;
        copy.commIdentifier = self.commIdentifier;
        copy.commodityIshot = self.commodityIshot;
        copy.commoditySerial = self.commoditySerial;
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityWeight = self.commodityWeight;
        copy.commodityIsnew = self.commodityIsnew;
        copy.commodityMarketprice = self.commodityMarketprice;
        copy.commodityAttributeValues = [self.commodityAttributeValues copyWithZone:zone];
        copy.commodityIsonsales = self.commodityIsonsales;
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityDesc = [self.commodityDesc copyWithZone:zone];
        copy.commodityAttributeName = [self.commodityAttributeName copyWithZone:zone];
        copy.commodityManufacturer = [self.commodityManufacturer copyWithZone:zone];
        copy.commodityProarea = [self.commodityProarea copyWithZone:zone];
        copy.commodityShowtime = [self.commodityShowtime copyWithZone:zone];
        copy.commodityFreight = self.commodityFreight;
        copy.commodityAttributeNameEn = [self.commodityAttributeNameEn copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commodityImages = [self.commodityImages copyWithZone:zone];
        copy.commodityDigest = [self.commodityDigest copyWithZone:zone];
        copy.commoditySend = [self.commoditySend copyWithZone:zone];
        copy.amountTotal = self.amountTotal;
        copy.commodityAttributeValuesEn = [self.commodityAttributeValuesEn copyWithZone:zone];
        copy.commodityLookcount = self.commodityLookcount;
        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.commodityGrade = self.commodityGrade;
        copy.commoditySales = self.commoditySales;
        copy.categorySerial = self.categorySerial;
    }
    
    return copy;
}


@end
