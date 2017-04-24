//
//  OrderListCommodity.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderListCommodity.h"


NSString *const kOrderListCommodityCommodityIscomment = @"commodity_iscomment";
NSString *const kOrderListCommodityCommoditySerial = @"commodity_serial";
NSString *const kOrderListCommodityId = @"id";
NSString *const kOrderListCommodityCommodityName = @"commodity_name";
NSString *const kOrderListCommodityCommodityFreight = @"commodity_freight";
NSString *const kOrderListCommodityCommodityImagesPath = @"commodity_images_path";
NSString *const kOrderListCommodityCommodityQuantity = @"commodity_quantity";
NSString *const kOrderListCommodityCommodityAttributes = @"commodity_attributes";
NSString *const kOrderListCommodityCommoditySellprice = @"commodity_sellprice";
NSString *const kOrderListCommodityCommodityCoverImage = @"commodity_cover_image";


@interface OrderListCommodity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderListCommodity

@synthesize commodityIscomment = _commodityIscomment;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityIdentifier = _commodityIdentifier;
@synthesize commodityName = _commodityName;
@synthesize commodityFreight = _commodityFreight;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityQuantity = _commodityQuantity;
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
            self.commodityIscomment = [self objectOrNilForKey:kOrderListCommodityCommodityIscomment fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kOrderListCommodityCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityIdentifier = [[self objectOrNilForKey:kOrderListCommodityId fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kOrderListCommodityCommodityName fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kOrderListCommodityCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kOrderListCommodityCommodityImagesPath fromDictionary:dict];
            self.commodityQuantity = [[self objectOrNilForKey:kOrderListCommodityCommodityQuantity fromDictionary:dict] doubleValue];
            self.commodityAttributes = [self objectOrNilForKey:kOrderListCommodityCommodityAttributes fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kOrderListCommodityCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kOrderListCommodityCommodityCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commodityIscomment forKey:kOrderListCommodityCommodityIscomment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kOrderListCommodityCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIdentifier] forKey:kOrderListCommodityId];
    [mutableDict setValue:self.commodityName forKey:kOrderListCommodityCommodityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kOrderListCommodityCommodityFreight];
    [mutableDict setValue:self.commodityImagesPath forKey:kOrderListCommodityCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityQuantity] forKey:kOrderListCommodityCommodityQuantity];
    [mutableDict setValue:self.commodityAttributes forKey:kOrderListCommodityCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kOrderListCommodityCommoditySellprice];
    [mutableDict setValue:self.commodityCoverImage forKey:kOrderListCommodityCommodityCoverImage];

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

    self.commodityIscomment = [aDecoder decodeObjectForKey:kOrderListCommodityCommodityIscomment];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kOrderListCommodityCommoditySerial];
    self.commodityIdentifier = [aDecoder decodeDoubleForKey:kOrderListCommodityId];
    self.commodityName = [aDecoder decodeObjectForKey:kOrderListCommodityCommodityName];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kOrderListCommodityCommodityFreight];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kOrderListCommodityCommodityImagesPath];
    self.commodityQuantity = [aDecoder decodeDoubleForKey:kOrderListCommodityCommodityQuantity];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kOrderListCommodityCommodityAttributes];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kOrderListCommodityCommoditySellprice];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kOrderListCommodityCommodityCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commodityIscomment forKey:kOrderListCommodityCommodityIscomment];
    [aCoder encodeDouble:_commoditySerial forKey:kOrderListCommodityCommoditySerial];
    [aCoder encodeDouble:_commodityIdentifier forKey:kOrderListCommodityId];
    [aCoder encodeObject:_commodityName forKey:kOrderListCommodityCommodityName];
    [aCoder encodeDouble:_commodityFreight forKey:kOrderListCommodityCommodityFreight];
    [aCoder encodeObject:_commodityImagesPath forKey:kOrderListCommodityCommodityImagesPath];
    [aCoder encodeDouble:_commodityQuantity forKey:kOrderListCommodityCommodityQuantity];
    [aCoder encodeObject:_commodityAttributes forKey:kOrderListCommodityCommodityAttributes];
    [aCoder encodeDouble:_commoditySellprice forKey:kOrderListCommodityCommoditySellprice];
    [aCoder encodeObject:_commodityCoverImage forKey:kOrderListCommodityCommodityCoverImage];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderListCommodity *copy = [[OrderListCommodity alloc] init];
    
    
    
    if (copy) {

        copy.commodityIscomment = [self.commodityIscomment copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodityIdentifier = self.commodityIdentifier;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityFreight = self.commodityFreight;
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityQuantity = self.commodityQuantity;
        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
    }
    
    return copy;
}


@end
