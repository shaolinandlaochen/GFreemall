//
//  OrderDetailsCommodity.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderDetailsCommodity.h"


NSString *const kOrderDetailsCommodityCommodityIscomment = @"commodity_iscomment";
NSString *const kOrderDetailsCommodityCommoditySerial = @"commodity_serial";
NSString *const kOrderDetailsCommodityId = @"id";
NSString *const kOrderDetailsCommodityCommodityName = @"commodity_name";
NSString *const kOrderDetailsCommodityCommodityImagesPath = @"commodity_images_path";
NSString *const kOrderDetailsCommodityCommodityFreight = @"commodity_freight";
NSString *const kOrderDetailsCommodityCommodityQuantity = @"commodity_quantity";
NSString *const kOrderDetailsCommodityCommodityAttributes = @"commodity_attributes";
NSString *const kOrderDetailsCommodityCommoditySellprice = @"commodity_sellprice";
NSString *const kOrderDetailsCommodityCommodityCoverImage = @"commodity_cover_image";


@interface OrderDetailsCommodity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderDetailsCommodity

@synthesize commodityIscomment = _commodityIscomment;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityIdentifier = _commodityIdentifier;
@synthesize commodityName = _commodityName;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityFreight = _commodityFreight;
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
            self.commodityIscomment = [[self objectOrNilForKey:kOrderDetailsCommodityCommodityIscomment fromDictionary:dict] doubleValue];
            self.commoditySerial = [[self objectOrNilForKey:kOrderDetailsCommodityCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityIdentifier = [[self objectOrNilForKey:kOrderDetailsCommodityId fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kOrderDetailsCommodityCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kOrderDetailsCommodityCommodityImagesPath fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kOrderDetailsCommodityCommodityFreight fromDictionary:dict] doubleValue];
            self.commodityQuantity = [[self objectOrNilForKey:kOrderDetailsCommodityCommodityQuantity fromDictionary:dict] doubleValue];
            self.commodityAttributes = [self objectOrNilForKey:kOrderDetailsCommodityCommodityAttributes fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kOrderDetailsCommodityCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kOrderDetailsCommodityCommodityCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIscomment] forKey:kOrderDetailsCommodityCommodityIscomment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kOrderDetailsCommodityCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityIdentifier] forKey:kOrderDetailsCommodityId];
    [mutableDict setValue:self.commodityName forKey:kOrderDetailsCommodityCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kOrderDetailsCommodityCommodityImagesPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kOrderDetailsCommodityCommodityFreight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityQuantity] forKey:kOrderDetailsCommodityCommodityQuantity];
    [mutableDict setValue:self.commodityAttributes forKey:kOrderDetailsCommodityCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kOrderDetailsCommodityCommoditySellprice];
    [mutableDict setValue:self.commodityCoverImage forKey:kOrderDetailsCommodityCommodityCoverImage];

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

    self.commodityIscomment = [aDecoder decodeDoubleForKey:kOrderDetailsCommodityCommodityIscomment];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kOrderDetailsCommodityCommoditySerial];
    self.commodityIdentifier = [aDecoder decodeDoubleForKey:kOrderDetailsCommodityId];
    self.commodityName = [aDecoder decodeObjectForKey:kOrderDetailsCommodityCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kOrderDetailsCommodityCommodityImagesPath];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kOrderDetailsCommodityCommodityFreight];
    self.commodityQuantity = [aDecoder decodeDoubleForKey:kOrderDetailsCommodityCommodityQuantity];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kOrderDetailsCommodityCommodityAttributes];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kOrderDetailsCommodityCommoditySellprice];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kOrderDetailsCommodityCommodityCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commodityIscomment forKey:kOrderDetailsCommodityCommodityIscomment];
    [aCoder encodeDouble:_commoditySerial forKey:kOrderDetailsCommodityCommoditySerial];
    [aCoder encodeDouble:_commodityIdentifier forKey:kOrderDetailsCommodityId];
    [aCoder encodeObject:_commodityName forKey:kOrderDetailsCommodityCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kOrderDetailsCommodityCommodityImagesPath];
    [aCoder encodeDouble:_commodityFreight forKey:kOrderDetailsCommodityCommodityFreight];
    [aCoder encodeDouble:_commodityQuantity forKey:kOrderDetailsCommodityCommodityQuantity];
    [aCoder encodeObject:_commodityAttributes forKey:kOrderDetailsCommodityCommodityAttributes];
    [aCoder encodeDouble:_commoditySellprice forKey:kOrderDetailsCommodityCommoditySellprice];
    [aCoder encodeObject:_commodityCoverImage forKey:kOrderDetailsCommodityCommodityCoverImage];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderDetailsCommodity *copy = [[OrderDetailsCommodity alloc] init];
    
    
    
    if (copy) {

        copy.commodityIscomment = self.commodityIscomment;
        copy.commoditySerial = self.commoditySerial;
        copy.commodityIdentifier = self.commodityIdentifier;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityFreight = self.commodityFreight;
        copy.commodityQuantity = self.commodityQuantity;
        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
    }
    
    return copy;
}


@end
