//
//  ShoppingSettlementCarts.m
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingSettlementCarts.h"


NSString *const kShoppingSettlementCartsCommodityWeight = @"commodity_weight";
NSString *const kShoppingSettlementCartsCommodityCoverImage = @"commodity_cover_image";
NSString *const kShoppingSettlementCartsCommodityAttributes = @"commodity_attributes";
NSString *const kShoppingSettlementCartsCommodityFreight = @"commodity_freight";
NSString *const kShoppingSettlementCartsCommodityMarketprice = @"commodity_marketprice";
NSString *const kShoppingSettlementCartsCount = @"count";
NSString *const kShoppingSettlementCartsCommodityAttributeValues = @"commodity_attribute_values";
NSString *const kShoppingSettlementCartsCommodityAttributeName = @"commodity_attribute_name";
NSString *const kShoppingSettlementCartsCommodityImagesPath = @"commodity_images_path";
NSString *const kShoppingSettlementCartsCategorySerial = @"category_serial";
NSString *const kShoppingSettlementCartsCommoditySend = @"commodity_send";
NSString *const kShoppingSettlementCartsId = @"id";
NSString *const kShoppingSettlementCartsCommodityImages = @"commodity_images";
NSString *const kShoppingSettlementCartsBrandSerial = @"brand_serial";
NSString *const kShoppingSettlementCartsCommoditySellprice = @"commodity_sellprice";
NSString *const kShoppingSettlementCartsCommodityReserves = @"commodity_reserves";
NSString *const kShoppingSettlementCartsCommodityId = @"commodity_id";
NSString *const kShoppingSettlementCartsCommodityDiscount = @"commodity_discount";
NSString *const kShoppingSettlementCartsCommodityName = @"commodity_name";
NSString *const kShoppingSettlementCartsCommodityIsPackage = @"commodity_is_package";


@interface ShoppingSettlementCarts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingSettlementCarts

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
@synthesize cartsIdentifier = _cartsIdentifier;
@synthesize commodityImages = _commodityImages;
@synthesize brandSerial = _brandSerial;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityReserves = _commodityReserves;
@synthesize commodityId = _commodityId;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityName = _commodityName;
@synthesize commodityIsPackage = _commodityIsPackage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityWeight = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityWeight fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kShoppingSettlementCartsCommodityCoverImage fromDictionary:dict];
            self.commodityAttributes = [self objectOrNilForKey:kShoppingSettlementCartsCommodityAttributes fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityMarketprice = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityMarketprice fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kShoppingSettlementCartsCount fromDictionary:dict] doubleValue];
            self.commodityAttributeValues = [self objectOrNilForKey:kShoppingSettlementCartsCommodityAttributeValues fromDictionary:dict];
            self.commodityAttributeName = [self objectOrNilForKey:kShoppingSettlementCartsCommodityAttributeName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kShoppingSettlementCartsCommodityImagesPath fromDictionary:dict];
            self.categorySerial = [[self objectOrNilForKey:kShoppingSettlementCartsCategorySerial fromDictionary:dict] doubleValue];
            self.commoditySend = [self objectOrNilForKey:kShoppingSettlementCartsCommoditySend fromDictionary:dict];
            self.cartsIdentifier = [[self objectOrNilForKey:kShoppingSettlementCartsId fromDictionary:dict] doubleValue];
            self.commodityImages = [self objectOrNilForKey:kShoppingSettlementCartsCommodityImages fromDictionary:dict];
            self.brandSerial = [[self objectOrNilForKey:kShoppingSettlementCartsBrandSerial fromDictionary:dict] doubleValue];
            self.commoditySellprice = [[self objectOrNilForKey:kShoppingSettlementCartsCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityReserves fromDictionary:dict] doubleValue];
            self.commodityId = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityId fromDictionary:dict] doubleValue];
            self.commodityDiscount = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kShoppingSettlementCartsCommodityName fromDictionary:dict];
            self.commodityIsPackage = [[self objectOrNilForKey:kShoppingSettlementCartsCommodityIsPackage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityWeight] forKey:kShoppingSettlementCartsCommodityWeight];
    [mutableDict setValue:self.commodityCoverImage forKey:kShoppingSettlementCartsCommodityCoverImage];
    [mutableDict setValue:self.commodityAttributes forKey:kShoppingSettlementCartsCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kShoppingSettlementCartsCommodityFreight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kShoppingSettlementCartsCommodityMarketprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kShoppingSettlementCartsCount];
    [mutableDict setValue:self.commodityAttributeValues forKey:kShoppingSettlementCartsCommodityAttributeValues];
    [mutableDict setValue:self.commodityAttributeName forKey:kShoppingSettlementCartsCommodityAttributeName];
    [mutableDict setValue:self.commodityImagesPath forKey:kShoppingSettlementCartsCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kShoppingSettlementCartsCategorySerial];
    [mutableDict setValue:self.commoditySend forKey:kShoppingSettlementCartsCommoditySend];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cartsIdentifier] forKey:kShoppingSettlementCartsId];
    [mutableDict setValue:self.commodityImages forKey:kShoppingSettlementCartsCommodityImages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSerial] forKey:kShoppingSettlementCartsBrandSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kShoppingSettlementCartsCommoditySellprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kShoppingSettlementCartsCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityId] forKey:kShoppingSettlementCartsCommodityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kShoppingSettlementCartsCommodityDiscount];
    [mutableDict setValue:self.commodityName forKey:kShoppingSettlementCartsCommodityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIsPackage] forKey:kShoppingSettlementCartsCommodityIsPackage];

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

    self.commodityWeight = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityWeight];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityCoverImage];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityAttributes];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityFreight];
    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityMarketprice];
    self.count = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCount];
    self.commodityAttributeValues = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityAttributeValues];
    self.commodityAttributeName = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityAttributeName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityImagesPath];
    self.categorySerial = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCategorySerial];
    self.commoditySend = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommoditySend];
    self.cartsIdentifier = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsId];
    self.commodityImages = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityImages];
    self.brandSerial = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsBrandSerial];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommoditySellprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityReserves];
    self.commodityId = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityId];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityDiscount];
    self.commodityName = [aDecoder decodeObjectForKey:kShoppingSettlementCartsCommodityName];
    self.commodityIsPackage = [aDecoder decodeDoubleForKey:kShoppingSettlementCartsCommodityIsPackage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityWeight forKey:kShoppingSettlementCartsCommodityWeight];
    [aCoder encodeObject:_commodityCoverImage forKey:kShoppingSettlementCartsCommodityCoverImage];
    [aCoder encodeObject:_commodityAttributes forKey:kShoppingSettlementCartsCommodityAttributes];
    [aCoder encodeDouble:_commodityFreight forKey:kShoppingSettlementCartsCommodityFreight];
    [aCoder encodeDouble:_commodityMarketprice forKey:kShoppingSettlementCartsCommodityMarketprice];
    [aCoder encodeDouble:_count forKey:kShoppingSettlementCartsCount];
    [aCoder encodeObject:_commodityAttributeValues forKey:kShoppingSettlementCartsCommodityAttributeValues];
    [aCoder encodeObject:_commodityAttributeName forKey:kShoppingSettlementCartsCommodityAttributeName];
    [aCoder encodeObject:_commodityImagesPath forKey:kShoppingSettlementCartsCommodityImagesPath];
    [aCoder encodeDouble:_categorySerial forKey:kShoppingSettlementCartsCategorySerial];
    [aCoder encodeObject:_commoditySend forKey:kShoppingSettlementCartsCommoditySend];
    [aCoder encodeDouble:_cartsIdentifier forKey:kShoppingSettlementCartsId];
    [aCoder encodeObject:_commodityImages forKey:kShoppingSettlementCartsCommodityImages];
    [aCoder encodeDouble:_brandSerial forKey:kShoppingSettlementCartsBrandSerial];
    [aCoder encodeDouble:_commoditySellprice forKey:kShoppingSettlementCartsCommoditySellprice];
    [aCoder encodeDouble:_commodityReserves forKey:kShoppingSettlementCartsCommodityReserves];
    [aCoder encodeDouble:_commodityId forKey:kShoppingSettlementCartsCommodityId];
    [aCoder encodeDouble:_commodityDiscount forKey:kShoppingSettlementCartsCommodityDiscount];
    [aCoder encodeObject:_commodityName forKey:kShoppingSettlementCartsCommodityName];
    [aCoder encodeDouble:_commodityIsPackage forKey:kShoppingSettlementCartsCommodityIsPackage];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingSettlementCarts *copy = [[ShoppingSettlementCarts alloc] init];
    
    
    
    if (copy) {

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
        copy.cartsIdentifier = self.cartsIdentifier;
        copy.commodityImages = [self.commodityImages copyWithZone:zone];
        copy.brandSerial = self.brandSerial;
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityReserves = self.commodityReserves;
        copy.commodityId = self.commodityId;
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityIsPackage = self.commodityIsPackage;
    }
    
    return copy;
}


@end
