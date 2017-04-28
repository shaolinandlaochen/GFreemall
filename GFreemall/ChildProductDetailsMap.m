//
//  ChildProductDetailsMap.m
//
//  Created by   on 2017/4/28
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ChildProductDetailsMap.h"


NSString *const kChildProductDetailsMapCommodityMarketprice = @"commodity_marketprice";
NSString *const kChildProductDetailsMapCommodityReserves = @"commodity_reserves";
NSString *const kChildProductDetailsMapCommoditySerial = @"commodity_serial";
NSString *const kChildProductDetailsMapCommodityImages = @"commodity_images";
NSString *const kChildProductDetailsMapCommodityImagesPath = @"commodity_images_path";
NSString *const kChildProductDetailsMapCommodityDiscount = @"commodity_discount";
NSString *const kChildProductDetailsMapCommodityAttributes = @"commodity_attributes";
NSString *const kChildProductDetailsMapCommoditySellprice = @"commodity_sellprice";
NSString *const kChildProductDetailsMapCommodityCoverImage = @"commodity_cover_image";


@interface ChildProductDetailsMap ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ChildProductDetailsMap

@synthesize commodityMarketprice = _commodityMarketprice;
@synthesize commodityReserves = _commodityReserves;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityImages = _commodityImages;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityDiscount = _commodityDiscount;
@synthesize commodityAttributes = _commodityAttributes;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityCoverImage = _commodityCoverImage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityMarketprice = [[self objectOrNilForKey:kChildProductDetailsMapCommodityMarketprice fromDictionary:dict] doubleValue];
            self.commodityReserves = [[self objectOrNilForKey:kChildProductDetailsMapCommodityReserves fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kChildProductDetailsMapCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityImages = [self objectOrNilForKey:kChildProductDetailsMapCommodityImages fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kChildProductDetailsMapCommodityImagesPath fromDictionary:dict];
            self.commodityDiscount = [[self objectOrNilForKey:kChildProductDetailsMapCommodityDiscount fromDictionary:dict] doubleValue];
            self.commodityAttributes = [self objectOrNilForKey:kChildProductDetailsMapCommodityAttributes fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kChildProductDetailsMapCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kChildProductDetailsMapCommodityCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityMarketprice] forKey:kChildProductDetailsMapCommodityMarketprice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityReserves] forKey:kChildProductDetailsMapCommodityReserves];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kChildProductDetailsMapCommoditySerial];
    [mutableDict setValue:self.commodityImages forKey:kChildProductDetailsMapCommodityImages];
    [mutableDict setValue:self.commodityImagesPath forKey:kChildProductDetailsMapCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityDiscount] forKey:kChildProductDetailsMapCommodityDiscount];
    [mutableDict setValue:self.commodityAttributes forKey:kChildProductDetailsMapCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kChildProductDetailsMapCommoditySellprice];
    [mutableDict setValue:self.commodityCoverImage forKey:kChildProductDetailsMapCommodityCoverImage];

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

    self.commodityMarketprice = [aDecoder decodeDoubleForKey:kChildProductDetailsMapCommodityMarketprice];
    self.commodityReserves = [aDecoder decodeDoubleForKey:kChildProductDetailsMapCommodityReserves];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kChildProductDetailsMapCommoditySerial];
    self.commodityImages = [aDecoder decodeObjectForKey:kChildProductDetailsMapCommodityImages];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kChildProductDetailsMapCommodityImagesPath];
    self.commodityDiscount = [aDecoder decodeDoubleForKey:kChildProductDetailsMapCommodityDiscount];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kChildProductDetailsMapCommodityAttributes];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kChildProductDetailsMapCommoditySellprice];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kChildProductDetailsMapCommodityCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityMarketprice forKey:kChildProductDetailsMapCommodityMarketprice];
    [aCoder encodeDouble:_commodityReserves forKey:kChildProductDetailsMapCommodityReserves];
    [aCoder encodeDouble:_commoditySerial forKey:kChildProductDetailsMapCommoditySerial];
    [aCoder encodeObject:_commodityImages forKey:kChildProductDetailsMapCommodityImages];
    [aCoder encodeObject:_commodityImagesPath forKey:kChildProductDetailsMapCommodityImagesPath];
    [aCoder encodeDouble:_commodityDiscount forKey:kChildProductDetailsMapCommodityDiscount];
    [aCoder encodeObject:_commodityAttributes forKey:kChildProductDetailsMapCommodityAttributes];
    [aCoder encodeDouble:_commoditySellprice forKey:kChildProductDetailsMapCommoditySellprice];
    [aCoder encodeObject:_commodityCoverImage forKey:kChildProductDetailsMapCommodityCoverImage];
}

- (id)copyWithZone:(NSZone *)zone {
    ChildProductDetailsMap *copy = [[ChildProductDetailsMap alloc] init];
    
    
    
    if (copy) {

        copy.commodityMarketprice = self.commodityMarketprice;
        copy.commodityReserves = self.commodityReserves;
        copy.commoditySerial = self.commoditySerial;
        copy.commodityImages = [self.commodityImages copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityDiscount = self.commodityDiscount;
        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
    }
    
    return copy;
}


@end
