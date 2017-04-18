//
//  ShoppingCarComm.m
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingCarComm.h"


NSString *const kShoppingCarCommCommodityLookcount = @"commodity_lookcount";
NSString *const kShoppingCarCommCommodityWeight = @"commodity_weight";
NSString *const kShoppingCarCommCommodityCoverImage = @"commodity_cover_image";
NSString *const kShoppingCarCommCommoditySales = @"commodity_sales";
NSString *const kShoppingCarCommCommodityName = @"commodity_name";
NSString *const kShoppingCarCommCommodityDesc = @"commodity_desc";
NSString *const kShoppingCarCommCommodityFreight = @"commodity_freight";
NSString *const kShoppingCarCommCommodityMarketprice = @"commodity_marketprice";
NSString *const kShoppingCarCommCommodityIsrecommend = @"commodity_isrecommend";
NSString *const kShoppingCarCommCommodityDigest = @"commodity_digest";
NSString *const kShoppingCarCommCommodityShowtime = @"commodity_showtime";
NSString *const kShoppingCarCommCommodityAttributeName = @"commodity_attribute_name";
NSString *const kShoppingCarCommCommodityGrade = @"commodity_grade";
NSString *const kShoppingCarCommCommodityImagesPath = @"commodity_images_path";
NSString *const kShoppingCarCommCategorySerial = @"category_serial";
NSString *const kShoppingCarCommCommoditySend = @"commodity_send";
NSString *const kShoppingCarCommCommodityAttributeValues = @"commodity_attribute_values";
NSString *const kShoppingCarCommId = @"id";
NSString *const kShoppingCarCommCommodityProarea = @"commodity_proarea";
NSString *const kShoppingCarCommCommodityImages = @"commodity_images";
NSString *const kShoppingCarCommCommodityAttributeValuesEn = @"commodity_attribute_values_en";
NSString *const kShoppingCarCommCommodityManufacturer = @"commodity_manufacturer";
NSString *const kShoppingCarCommBrandSerial = @"brand_serial";
NSString *const kShoppingCarCommCommoditySellprice = @"commodity_sellprice";
NSString *const kShoppingCarCommCommodityIshot = @"commodity_ishot";
NSString *const kShoppingCarCommCommodityIsnew = @"commodity_isnew";
NSString *const kShoppingCarCommCommodityAttributeNameEn = @"commodity_attribute_name_en";
NSString *const kShoppingCarCommCommodityReserves = @"commodity_reserves";
NSString *const kShoppingCarCommCommoditySerial = @"commodity_serial";
NSString *const kShoppingCarCommCommodityIsPackage = @"commodity_is_package";
NSString *const kShoppingCarCommCommodityDiscount = @"commodity_discount";
NSString *const kShoppingCarCommCommodityIsonsales = @"commodity_isonsales";


@interface ShoppingCarComm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingCarComm

@synthesize commodityLookcount = _commodityLookcount;
@synthesize commodityWeight = _commodityWeight;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commoditySales = _commoditySales;
@synthesize commodityName = _commodityName;
@synthesize commodityDesc = _commodityDesc;
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
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityIsPackage = _commodityIsPackage;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityIsonsales = _commodityIsonsales;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityLookcount = [[self objectOrNilForKey:kShoppingCarCommCommodityLookcount fromDictionary:dict] doubleValue];
            self.commodityWeight = [[self objectOrNilForKey:kShoppingCarCommCommodityWeight fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kShoppingCarCommCommodityCoverImage fromDictionary:dict];
            self.commoditySales = [[self objectOrNilForKey:kShoppingCarCommCommoditySales fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kShoppingCarCommCommodityName fromDictionary:dict];
            self.commodityDesc = [self objectOrNilForKey:kShoppingCarCommCommodityDesc fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kShoppingCarCommCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityMarketprice = [[self objectOrNilForKey:kShoppingCarCommCommodityMarketprice fromDictionary:dict] doubleValue];
            self.commodityIsrecommend = [[self objectOrNilForKey:kShoppingCarCommCommodityIsrecommend fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kShoppingCarCommCommodityDigest fromDictionary:dict];
            self.commodityShowtime = [self objectOrNilForKey:kShoppingCarCommCommodityShowtime fromDictionary:dict];
            self.commodityAttributeName = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeName fromDictionary:dict];
            self.commodityGrade = [[self objectOrNilForKey:kShoppingCarCommCommodityGrade fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kShoppingCarCommCommodityImagesPath fromDictionary:dict];
            self.categorySerial = [[self objectOrNilForKey:kShoppingCarCommCategorySerial fromDictionary:dict] doubleValue];
            self.commoditySend = [self objectOrNilForKey:kShoppingCarCommCommoditySend fromDictionary:dict];
            self.commodityAttributeValues = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeValues fromDictionary:dict];
            self.commIdentifier = [[self objectOrNilForKey:kShoppingCarCommId fromDictionary:dict] doubleValue];
            self.commodityProarea = [self objectOrNilForKey:kShoppingCarCommCommodityProarea fromDictionary:dict];
            self.commodityImages = [self objectOrNilForKey:kShoppingCarCommCommodityImages fromDictionary:dict];
            self.commodityAttributeValuesEn = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeValuesEn fromDictionary:dict];
            self.commodityManufacturer = [self objectOrNilForKey:kShoppingCarCommCommodityManufacturer fromDictionary:dict];
            self.brandSerial = [[self objectOrNilForKey:kShoppingCarCommBrandSerial fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kShoppingCarCommCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityIshot = [[self objectOrNilForKey:kShoppingCarCommCommodityIshot fromDictionary:dict] doubleValue];
            self.commodityIsnew = [[self objectOrNilForKey:kShoppingCarCommCommodityIsnew fromDictionary:dict] doubleValue];
            self.commodityAttributeNameEn = [self objectOrNilForKey:kShoppingCarCommCommodityAttributeNameEn fromDictionary:dict];
            self.commodityReserves = [[self objectOrNilForKey:kShoppingCarCommCommodityReserves fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kShoppingCarCommCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityIsPackage = [[self objectOrNilForKey:kShoppingCarCommCommodityIsPackage fromDictionary:dict] doubleValue];
            self.commodityDiscount = [[self objectOrNilForKey:kShoppingCarCommCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityIsonsales = [[self objectOrNilForKey:kShoppingCarCommCommodityIsonsales fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityLookcount] forKey:kShoppingCarCommCommodityLookcount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityWeight] forKey:kShoppingCarCommCommodityWeight];
    [mutableDict setValue:self.commodityCoverImage forKey:kShoppingCarCommCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySales] forKey:kShoppingCarCommCommoditySales];
    [mutableDict setValue:self.commodityName forKey:kShoppingCarCommCommodityName];
    [mutableDict setValue:self.commodityDesc forKey:kShoppingCarCommCommodityDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kShoppingCarCommCommodityFreight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kShoppingCarCommCommodityMarketprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsrecommend] forKey:kShoppingCarCommCommodityIsrecommend];
    [mutableDict setValue:self.commodityDigest forKey:kShoppingCarCommCommodityDigest];
    [mutableDict setValue:self.commodityShowtime forKey:kShoppingCarCommCommodityShowtime];
    [mutableDict setValue:self.commodityAttributeName forKey:kShoppingCarCommCommodityAttributeName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityGrade] forKey:kShoppingCarCommCommodityGrade];
    [mutableDict setValue:self.commodityImagesPath forKey:kShoppingCarCommCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kShoppingCarCommCategorySerial];
    [mutableDict setValue:self.commoditySend forKey:kShoppingCarCommCommoditySend];
    [mutableDict setValue:self.commodityAttributeValues forKey:kShoppingCarCommCommodityAttributeValues];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commIdentifier] forKey:kShoppingCarCommId];
    [mutableDict setValue:self.commodityProarea forKey:kShoppingCarCommCommodityProarea];
    [mutableDict setValue:self.commodityImages forKey:kShoppingCarCommCommodityImages];
    [mutableDict setValue:self.commodityAttributeValuesEn forKey:kShoppingCarCommCommodityAttributeValuesEn];
    [mutableDict setValue:self.commodityManufacturer forKey:kShoppingCarCommCommodityManufacturer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSerial] forKey:kShoppingCarCommBrandSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kShoppingCarCommCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIshot] forKey:kShoppingCarCommCommodityIshot];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsnew] forKey:kShoppingCarCommCommodityIsnew];
    [mutableDict setValue:self.commodityAttributeNameEn forKey:kShoppingCarCommCommodityAttributeNameEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kShoppingCarCommCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kShoppingCarCommCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsPackage] forKey:kShoppingCarCommCommodityIsPackage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kShoppingCarCommCommodityDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsonsales] forKey:kShoppingCarCommCommodityIsonsales];

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

    self.commodityLookcount = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityLookcount];
    self.commodityWeight = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityWeight];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityCoverImage];
    self.commoditySales = [aDecoder decodeDoubleForKey:kShoppingCarCommCommoditySales];
    self.commodityName = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityName];
    self.commodityDesc = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityDesc];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityFreight];
    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityMarketprice];
    self.commodityIsrecommend = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsrecommend];
    self.commodityDigest = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityDigest];
    self.commodityShowtime = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityShowtime];
    self.commodityAttributeName = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeName];
    self.commodityGrade = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityGrade];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityImagesPath];
    self.categorySerial = [aDecoder decodeDoubleForKey:kShoppingCarCommCategorySerial];
    self.commoditySend = [aDecoder decodeObjectForKey:kShoppingCarCommCommoditySend];
    self.commodityAttributeValues = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeValues];
    self.commIdentifier = [aDecoder decodeDoubleForKey:kShoppingCarCommId];
    self.commodityProarea = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityProarea];
    self.commodityImages = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityImages];
    self.commodityAttributeValuesEn = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeValuesEn];
    self.commodityManufacturer = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityManufacturer];
    self.brandSerial = [aDecoder decodeDoubleForKey:kShoppingCarCommBrandSerial];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kShoppingCarCommCommoditySellprice];
    self.commodityIshot = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIshot];
    self.commodityIsnew = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsnew];
    self.commodityAttributeNameEn = [aDecoder decodeObjectForKey:kShoppingCarCommCommodityAttributeNameEn];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityReserves];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kShoppingCarCommCommoditySerial];
    self.commodityIsPackage = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsPackage];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityDiscount];
    self.commodityIsonsales = [aDecoder decodeDoubleForKey:kShoppingCarCommCommodityIsonsales];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityLookcount forKey:kShoppingCarCommCommodityLookcount];
    [aCoder encodeDouble:_commodityWeight forKey:kShoppingCarCommCommodityWeight];
    [aCoder encodeObject:_commodityCoverImage forKey:kShoppingCarCommCommodityCoverImage];
    [aCoder encodeDouble:_commoditySales forKey:kShoppingCarCommCommoditySales];
    [aCoder encodeObject:_commodityName forKey:kShoppingCarCommCommodityName];
    [aCoder encodeObject:_commodityDesc forKey:kShoppingCarCommCommodityDesc];
    [aCoder encodeDouble:_commodityFreight forKey:kShoppingCarCommCommodityFreight];
    [aCoder encodeDouble:_commodityMarketprice forKey:kShoppingCarCommCommodityMarketprice];
    [aCoder encodeDouble:_commodityIsrecommend forKey:kShoppingCarCommCommodityIsrecommend];
    [aCoder encodeObject:_commodityDigest forKey:kShoppingCarCommCommodityDigest];
    [aCoder encodeObject:_commodityShowtime forKey:kShoppingCarCommCommodityShowtime];
    [aCoder encodeObject:_commodityAttributeName forKey:kShoppingCarCommCommodityAttributeName];
    [aCoder encodeDouble:_commodityGrade forKey:kShoppingCarCommCommodityGrade];
    [aCoder encodeObject:_commodityImagesPath forKey:kShoppingCarCommCommodityImagesPath];
    [aCoder encodeDouble:_categorySerial forKey:kShoppingCarCommCategorySerial];
    [aCoder encodeObject:_commoditySend forKey:kShoppingCarCommCommoditySend];
    [aCoder encodeObject:_commodityAttributeValues forKey:kShoppingCarCommCommodityAttributeValues];
    [aCoder encodeDouble:_commIdentifier forKey:kShoppingCarCommId];
    [aCoder encodeObject:_commodityProarea forKey:kShoppingCarCommCommodityProarea];
    [aCoder encodeObject:_commodityImages forKey:kShoppingCarCommCommodityImages];
    [aCoder encodeObject:_commodityAttributeValuesEn forKey:kShoppingCarCommCommodityAttributeValuesEn];
    [aCoder encodeObject:_commodityManufacturer forKey:kShoppingCarCommCommodityManufacturer];
    [aCoder encodeDouble:_brandSerial forKey:kShoppingCarCommBrandSerial];
    [aCoder encodeDouble:_commoditySellprice forKey:kShoppingCarCommCommoditySellprice];
    [aCoder encodeDouble:_commodityIshot forKey:kShoppingCarCommCommodityIshot];
    [aCoder encodeDouble:_commodityIsnew forKey:kShoppingCarCommCommodityIsnew];
    [aCoder encodeObject:_commodityAttributeNameEn forKey:kShoppingCarCommCommodityAttributeNameEn];
    [aCoder encodeDouble:_commodityReserves forKey:kShoppingCarCommCommodityReserves];
    [aCoder encodeDouble:_commoditySerial forKey:kShoppingCarCommCommoditySerial];
    [aCoder encodeDouble:_commodityIsPackage forKey:kShoppingCarCommCommodityIsPackage];
    [aCoder encodeDouble:_commodityDiscount forKey:kShoppingCarCommCommodityDiscount];
    [aCoder encodeDouble:_commodityIsonsales forKey:kShoppingCarCommCommodityIsonsales];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingCarComm *copy = [[ShoppingCarComm alloc] init];
    
    
    
    if (copy) {

        copy.commodityLookcount = self.commodityLookcount;
        copy.commodityWeight = self.commodityWeight;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commoditySales = self.commoditySales;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityDesc = [self.commodityDesc copyWithZone:zone];
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
        copy.commoditySerial = self.commoditySerial;
        copy.commodityIsPackage = self.commodityIsPackage;
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityIsonsales = self.commodityIsonsales;
    }
    
    return copy;
}


@end
