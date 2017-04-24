//
//  ShoppingSettlementAttr.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingSettlementAttr.h"


NSString *const kShoppingSettlementAttrCommodityIsPackage = @"commodity_is_package";
NSString *const kShoppingSettlementAttrCommodityWeight = @"commodity_weight";
NSString *const kShoppingSettlementAttrCommodityCoverImage = @"commodity_cover_image";
NSString *const kShoppingSettlementAttrCommodityAttributes = @"commodity_attributes";
NSString *const kShoppingSettlementAttrCommodityFreight = @"commodity_freight";
NSString *const kShoppingSettlementAttrCommodityMarketprice = @"commodity_marketprice";
NSString *const kShoppingSettlementAttrCount = @"count";
NSString *const kShoppingSettlementAttrCommodityAttributeValues = @"commodity_attribute_values";
NSString *const kShoppingSettlementAttrCommodityAttributeName = @"commodity_attribute_name";
NSString *const kShoppingSettlementAttrCommodityImagesPath = @"commodity_images_path";
NSString *const kShoppingSettlementAttrCategorySerial = @"category_serial";
NSString *const kShoppingSettlementAttrCommoditySend = @"commodity_send";
NSString *const kShoppingSettlementAttrId = @"id";
NSString *const kShoppingSettlementAttrCommodityImages = @"commodity_images";
NSString *const kShoppingSettlementAttrBrandSerial = @"brand_serial";
NSString *const kShoppingSettlementAttrCommoditySellprice = @"commodity_sellprice";
NSString *const kShoppingSettlementAttrCommodityReserves = @"commodity_reserves";
NSString *const kShoppingSettlementAttrCommoditySerial = @"commodity_serial";
NSString *const kShoppingSettlementAttrCommodityId = @"commodity_id";
NSString *const kShoppingSettlementAttrCommodityName = @"commodity_name";
NSString *const kShoppingSettlementAttrCommodityDiscount = @"commodity_discount";


@interface ShoppingSettlementAttr ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingSettlementAttr

@synthesize commodityIsPackage = _commodityIsPackage;
@synthesize commodityWeight = _commodityWeight;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commodityAttributes = _commodityAttributes;
@synthesize commodityFreight = _commodityFreight;
@synthesize commodityMarketprice = _commodityMarketprice;
@synthesize count = _count;
@synthesize commodityAttributeValues = _commodityAttributeValues;
@synthesize commodityAttributeName = _commodityAttributeName;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize categorySerial = _categorySerial;
@synthesize commoditySend = _commoditySend;
@synthesize attrIdentifier = _attrIdentifier;
@synthesize commodityImages = _commodityImages;
@synthesize brandSerial = _brandSerial;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityReserves = _commodityReserves;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityId = _commodityId;
@synthesize commodityName = _commodityName;
@synthesize commodityDiscount = _commodityDiscount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityIsPackage = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityIsPackage fromDictionary:dict] doubleValue];
            self.commodityWeight = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityWeight fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kShoppingSettlementAttrCommodityCoverImage fromDictionary:dict];
            self.commodityAttributes = [self objectOrNilForKey:kShoppingSettlementAttrCommodityAttributes fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityMarketprice = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityMarketprice fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kShoppingSettlementAttrCount fromDictionary:dict] doubleValue];
            self.commodityAttributeValues = [self objectOrNilForKey:kShoppingSettlementAttrCommodityAttributeValues fromDictionary:dict];
            self.commodityAttributeName = [self objectOrNilForKey:kShoppingSettlementAttrCommodityAttributeName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kShoppingSettlementAttrCommodityImagesPath fromDictionary:dict];
            self.categorySerial = [[self objectOrNilForKey:kShoppingSettlementAttrCategorySerial fromDictionary:dict] doubleValue];
            self.commoditySend = [self objectOrNilForKey:kShoppingSettlementAttrCommoditySend fromDictionary:dict];
            self.attrIdentifier = [[self objectOrNilForKey:kShoppingSettlementAttrId fromDictionary:dict] doubleValue];
            self.commodityImages = [self objectOrNilForKey:kShoppingSettlementAttrCommodityImages fromDictionary:dict];
            self.brandSerial = [[self objectOrNilForKey:kShoppingSettlementAttrBrandSerial fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kShoppingSettlementAttrCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityReserves fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kShoppingSettlementAttrCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityId = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityId fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kShoppingSettlementAttrCommodityName fromDictionary:dict];
            self.commodityDiscount = [[self objectOrNilForKey:kShoppingSettlementAttrCommodityDiscount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsPackage] forKey:kShoppingSettlementAttrCommodityIsPackage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityWeight] forKey:kShoppingSettlementAttrCommodityWeight];
    [mutableDict setValue:self.commodityCoverImage forKey:kShoppingSettlementAttrCommodityCoverImage];
    [mutableDict setValue:self.commodityAttributes forKey:kShoppingSettlementAttrCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kShoppingSettlementAttrCommodityFreight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kShoppingSettlementAttrCommodityMarketprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kShoppingSettlementAttrCount];
    [mutableDict setValue:self.commodityAttributeValues forKey:kShoppingSettlementAttrCommodityAttributeValues];
    [mutableDict setValue:self.commodityAttributeName forKey:kShoppingSettlementAttrCommodityAttributeName];
    [mutableDict setValue:self.commodityImagesPath forKey:kShoppingSettlementAttrCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kShoppingSettlementAttrCategorySerial];
    [mutableDict setValue:self.commoditySend forKey:kShoppingSettlementAttrCommoditySend];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attrIdentifier] forKey:kShoppingSettlementAttrId];
    [mutableDict setValue:self.commodityImages forKey:kShoppingSettlementAttrCommodityImages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSerial] forKey:kShoppingSettlementAttrBrandSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kShoppingSettlementAttrCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kShoppingSettlementAttrCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kShoppingSettlementAttrCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityId] forKey:kShoppingSettlementAttrCommodityId];
    [mutableDict setValue:self.commodityName forKey:kShoppingSettlementAttrCommodityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kShoppingSettlementAttrCommodityDiscount];

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

    self.commodityIsPackage = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityIsPackage];
    self.commodityWeight = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityWeight];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityCoverImage];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityAttributes];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityFreight];
    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityMarketprice];
    self.count = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCount];
    self.commodityAttributeValues = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityAttributeValues];
    self.commodityAttributeName = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityAttributeName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityImagesPath];
    self.categorySerial = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCategorySerial];
    self.commoditySend = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommoditySend];
    self.attrIdentifier = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrId];
    self.commodityImages = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityImages];
    self.brandSerial = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrBrandSerial];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommoditySellprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityReserves];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommoditySerial];
    self.commodityId = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityId];
    self.commodityName = [aDecoder decodeObjectForKey:kShoppingSettlementAttrCommodityName];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kShoppingSettlementAttrCommodityDiscount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityIsPackage forKey:kShoppingSettlementAttrCommodityIsPackage];
    [aCoder encodeDouble:_commodityWeight forKey:kShoppingSettlementAttrCommodityWeight];
    [aCoder encodeObject:_commodityCoverImage forKey:kShoppingSettlementAttrCommodityCoverImage];
    [aCoder encodeObject:_commodityAttributes forKey:kShoppingSettlementAttrCommodityAttributes];
    [aCoder encodeDouble:_commodityFreight forKey:kShoppingSettlementAttrCommodityFreight];
    [aCoder encodeDouble:_commodityMarketprice forKey:kShoppingSettlementAttrCommodityMarketprice];
    [aCoder encodeDouble:_count forKey:kShoppingSettlementAttrCount];
    [aCoder encodeObject:_commodityAttributeValues forKey:kShoppingSettlementAttrCommodityAttributeValues];
    [aCoder encodeObject:_commodityAttributeName forKey:kShoppingSettlementAttrCommodityAttributeName];
    [aCoder encodeObject:_commodityImagesPath forKey:kShoppingSettlementAttrCommodityImagesPath];
    [aCoder encodeDouble:_categorySerial forKey:kShoppingSettlementAttrCategorySerial];
    [aCoder encodeObject:_commoditySend forKey:kShoppingSettlementAttrCommoditySend];
    [aCoder encodeDouble:_attrIdentifier forKey:kShoppingSettlementAttrId];
    [aCoder encodeObject:_commodityImages forKey:kShoppingSettlementAttrCommodityImages];
    [aCoder encodeDouble:_brandSerial forKey:kShoppingSettlementAttrBrandSerial];
    [aCoder encodeDouble:_commoditySellprice forKey:kShoppingSettlementAttrCommoditySellprice];
    [aCoder encodeDouble:_commodityReserves forKey:kShoppingSettlementAttrCommodityReserves];
    [aCoder encodeDouble:_commoditySerial forKey:kShoppingSettlementAttrCommoditySerial];
    [aCoder encodeDouble:_commodityId forKey:kShoppingSettlementAttrCommodityId];
    [aCoder encodeObject:_commodityName forKey:kShoppingSettlementAttrCommodityName];
    [aCoder encodeDouble:_commodityDiscount forKey:kShoppingSettlementAttrCommodityDiscount];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingSettlementAttr *copy = [[ShoppingSettlementAttr alloc] init];
    
    
    
    if (copy) {

        copy.commodityIsPackage = self.commodityIsPackage;
        copy.commodityWeight = self.commodityWeight;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.commodityFreight = self.commodityFreight;
        copy.commodityMarketprice = self.commodityMarketprice;
        copy.count = self.count;
        copy.commodityAttributeValues = [self.commodityAttributeValues copyWithZone:zone];
        copy.commodityAttributeName = [self.commodityAttributeName copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.categorySerial = self.categorySerial;
        copy.commoditySend = [self.commoditySend copyWithZone:zone];
        copy.attrIdentifier = self.attrIdentifier;
        copy.commodityImages = [self.commodityImages copyWithZone:zone];
        copy.brandSerial = self.brandSerial;
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityReserves = self.commodityReserves;
        copy.commoditySerial = self.commoditySerial;
        copy.commodityId = self.commodityId;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityDiscount = self.commodityDiscount;
    }
    
    return copy;
}


@end
