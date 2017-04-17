//
//  HomeNews.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeNews.h"


NSString *const kHomeNewsCommodityDigestTw = @"commodity_digest_tw";
NSString *const kHomeNewsCommoditySerial = @"commodity_serial";
NSString *const kHomeNewsCommodityDigestEn = @"commodity_digest_en";
NSString *const kHomeNewsCommodityNameTw = @"commodity_name_tw";
NSString *const kHomeNewsCommodityName = @"commodity_name";
NSString *const kHomeNewsCommodityImagesPath = @"commodity_images_path";
NSString *const kHomeNewsCommodityNameEn = @"commodity_name_en";
NSString *const kHomeNewsCommoditySellprice = @"commodity_sellprice";
NSString *const kHomeNewsCommodityDigest = @"commodity_digest";
NSString *const kHomeNewsCommodityCoverImage = @"commodity_cover_image";


@interface HomeNews ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeNews

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
            self.commodityDigestTw = [self objectOrNilForKey:kHomeNewsCommodityDigestTw fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kHomeNewsCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityDigestEn = [self objectOrNilForKey:kHomeNewsCommodityDigestEn fromDictionary:dict];
            self.commodityNameTw = [self objectOrNilForKey:kHomeNewsCommodityNameTw fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kHomeNewsCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kHomeNewsCommodityImagesPath fromDictionary:dict];
            self.commodityNameEn = [self objectOrNilForKey:kHomeNewsCommodityNameEn fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kHomeNewsCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kHomeNewsCommodityDigest fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kHomeNewsCommodityCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commodityDigestTw forKey:kHomeNewsCommodityDigestTw];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kHomeNewsCommoditySerial];
    [mutableDict setValue:self.commodityDigestEn forKey:kHomeNewsCommodityDigestEn];
    [mutableDict setValue:self.commodityNameTw forKey:kHomeNewsCommodityNameTw];
    [mutableDict setValue:self.commodityName forKey:kHomeNewsCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kHomeNewsCommodityImagesPath];
    [mutableDict setValue:self.commodityNameEn forKey:kHomeNewsCommodityNameEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kHomeNewsCommoditySellprice];
    [mutableDict setValue:self.commodityDigest forKey:kHomeNewsCommodityDigest];
    [mutableDict setValue:self.commodityCoverImage forKey:kHomeNewsCommodityCoverImage];

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

    self.commodityDigestTw = [aDecoder decodeObjectForKey:kHomeNewsCommodityDigestTw];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kHomeNewsCommoditySerial];
    self.commodityDigestEn = [aDecoder decodeObjectForKey:kHomeNewsCommodityDigestEn];
    self.commodityNameTw = [aDecoder decodeObjectForKey:kHomeNewsCommodityNameTw];
    self.commodityName = [aDecoder decodeObjectForKey:kHomeNewsCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kHomeNewsCommodityImagesPath];
    self.commodityNameEn = [aDecoder decodeObjectForKey:kHomeNewsCommodityNameEn];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kHomeNewsCommoditySellprice];
    self.commodityDigest = [aDecoder decodeObjectForKey:kHomeNewsCommodityDigest];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kHomeNewsCommodityCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commodityDigestTw forKey:kHomeNewsCommodityDigestTw];
    [aCoder encodeDouble:_commoditySerial forKey:kHomeNewsCommoditySerial];
    [aCoder encodeObject:_commodityDigestEn forKey:kHomeNewsCommodityDigestEn];
    [aCoder encodeObject:_commodityNameTw forKey:kHomeNewsCommodityNameTw];
    [aCoder encodeObject:_commodityName forKey:kHomeNewsCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kHomeNewsCommodityImagesPath];
    [aCoder encodeObject:_commodityNameEn forKey:kHomeNewsCommodityNameEn];
    [aCoder encodeDouble:_commoditySellprice forKey:kHomeNewsCommoditySellprice];
    [aCoder encodeObject:_commodityDigest forKey:kHomeNewsCommodityDigest];
    [aCoder encodeObject:_commodityCoverImage forKey:kHomeNewsCommodityCoverImage];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeNews *copy = [[HomeNews alloc] init];
    
    
    
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
