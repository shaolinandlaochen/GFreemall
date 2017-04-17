//
//  HomeHot.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeHot.h"


NSString *const kHomeHotCommodityDigestTw = @"commodity_digest_tw";
NSString *const kHomeHotCommoditySerial = @"commodity_serial";
NSString *const kHomeHotCommodityDigestEn = @"commodity_digest_en";
NSString *const kHomeHotCommodityNameTw = @"commodity_name_tw";
NSString *const kHomeHotCommodityName = @"commodity_name";
NSString *const kHomeHotCommodityImagesPath = @"commodity_images_path";
NSString *const kHomeHotCommodityNameEn = @"commodity_name_en";
NSString *const kHomeHotCommoditySellprice = @"commodity_sellprice";
NSString *const kHomeHotCommodityDigest = @"commodity_digest";
NSString *const kHomeHotCommodityCoverImage = @"commodity_cover_image";


@interface HomeHot ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeHot

@synthesize commodityDigestTw = _commodityDigestTw;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityDigestEn = _commodityDigestEn;
@synthesize commodityNameTw = _commodityNameTw;
@synthesize commodityName = _commodityName;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityNameEn = _commodityNameEn;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityDigest = _commodityDigest;
@synthesize commodityCoverImage = _commodityCoverImage;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityDigestTw = [self objectOrNilForKey:kHomeHotCommodityDigestTw fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kHomeHotCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityDigestEn = [self objectOrNilForKey:kHomeHotCommodityDigestEn fromDictionary:dict];
            self.commodityNameTw = [self objectOrNilForKey:kHomeHotCommodityNameTw fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kHomeHotCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kHomeHotCommodityImagesPath fromDictionary:dict];
            self.commodityNameEn = [self objectOrNilForKey:kHomeHotCommodityNameEn fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kHomeHotCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kHomeHotCommodityDigest fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kHomeHotCommodityCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commodityDigestTw forKey:kHomeHotCommodityDigestTw];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kHomeHotCommoditySerial];
    [mutableDict setValue:self.commodityDigestEn forKey:kHomeHotCommodityDigestEn];
    [mutableDict setValue:self.commodityNameTw forKey:kHomeHotCommodityNameTw];
    [mutableDict setValue:self.commodityName forKey:kHomeHotCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kHomeHotCommodityImagesPath];
    [mutableDict setValue:self.commodityNameEn forKey:kHomeHotCommodityNameEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kHomeHotCommoditySellprice];
    [mutableDict setValue:self.commodityDigest forKey:kHomeHotCommodityDigest];
    [mutableDict setValue:self.commodityCoverImage forKey:kHomeHotCommodityCoverImage];

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

    self.commodityDigestTw = [aDecoder decodeObjectForKey:kHomeHotCommodityDigestTw];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kHomeHotCommoditySerial];
    self.commodityDigestEn = [aDecoder decodeObjectForKey:kHomeHotCommodityDigestEn];
    self.commodityNameTw = [aDecoder decodeObjectForKey:kHomeHotCommodityNameTw];
    self.commodityName = [aDecoder decodeObjectForKey:kHomeHotCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kHomeHotCommodityImagesPath];
    self.commodityNameEn = [aDecoder decodeObjectForKey:kHomeHotCommodityNameEn];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kHomeHotCommoditySellprice];
    self.commodityDigest = [aDecoder decodeObjectForKey:kHomeHotCommodityDigest];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kHomeHotCommodityCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commodityDigestTw forKey:kHomeHotCommodityDigestTw];
    [aCoder encodeDouble:_commoditySerial forKey:kHomeHotCommoditySerial];
    [aCoder encodeObject:_commodityDigestEn forKey:kHomeHotCommodityDigestEn];
    [aCoder encodeObject:_commodityNameTw forKey:kHomeHotCommodityNameTw];
    [aCoder encodeObject:_commodityName forKey:kHomeHotCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kHomeHotCommodityImagesPath];
    [aCoder encodeObject:_commodityNameEn forKey:kHomeHotCommodityNameEn];
    [aCoder encodeDouble:_commoditySellprice forKey:kHomeHotCommoditySellprice];
    [aCoder encodeObject:_commodityDigest forKey:kHomeHotCommodityDigest];
    [aCoder encodeObject:_commodityCoverImage forKey:kHomeHotCommodityCoverImage];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeHot *copy = [[HomeHot alloc] init];
    
    
    
    if (copy) {

        copy.commodityDigestTw = [self.commodityDigestTw copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodityDigestEn = [self.commodityDigestEn copyWithZone:zone];
        copy.commodityNameTw = [self.commodityNameTw copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityNameEn = [self.commodityNameEn copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityDigest = [self.commodityDigest copyWithZone:zone];
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
    }
    
    return copy;
}


@end
