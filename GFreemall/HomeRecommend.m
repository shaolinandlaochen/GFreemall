//
//  HomeRecommend.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeRecommend.h"


NSString *const kHomeRecommendCommodityDigestTw = @"commodity_digest_tw";
NSString *const kHomeRecommendCommoditySerial = @"commodity_serial";
NSString *const kHomeRecommendCommodityDigestEn = @"commodity_digest_en";
NSString *const kHomeRecommendCommodityNameTw = @"commodity_name_tw";
NSString *const kHomeRecommendCommodityName = @"commodity_name";
NSString *const kHomeRecommendCommodityImagesPath = @"commodity_images_path";
NSString *const kHomeRecommendCommodityNameEn = @"commodity_name_en";
NSString *const kHomeRecommendCommoditySellprice = @"commodity_sellprice";
NSString *const kHomeRecommendCommodityDigest = @"commodity_digest";
NSString *const kHomeRecommendCommodityCoverImage = @"commodity_cover_image";


@interface HomeRecommend ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeRecommend

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
            self.commodityDigestTw = [self objectOrNilForKey:kHomeRecommendCommodityDigestTw fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kHomeRecommendCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityDigestEn = [self objectOrNilForKey:kHomeRecommendCommodityDigestEn fromDictionary:dict];
            self.commodityNameTw = [self objectOrNilForKey:kHomeRecommendCommodityNameTw fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kHomeRecommendCommodityName fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kHomeRecommendCommodityImagesPath fromDictionary:dict];
            self.commodityNameEn = [self objectOrNilForKey:kHomeRecommendCommodityNameEn fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kHomeRecommendCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kHomeRecommendCommodityDigest fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kHomeRecommendCommodityCoverImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commodityDigestTw forKey:kHomeRecommendCommodityDigestTw];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kHomeRecommendCommoditySerial];
    [mutableDict setValue:self.commodityDigestEn forKey:kHomeRecommendCommodityDigestEn];
    [mutableDict setValue:self.commodityNameTw forKey:kHomeRecommendCommodityNameTw];
    [mutableDict setValue:self.commodityName forKey:kHomeRecommendCommodityName];
    [mutableDict setValue:self.commodityImagesPath forKey:kHomeRecommendCommodityImagesPath];
    [mutableDict setValue:self.commodityNameEn forKey:kHomeRecommendCommodityNameEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kHomeRecommendCommoditySellprice];
    [mutableDict setValue:self.commodityDigest forKey:kHomeRecommendCommodityDigest];
    [mutableDict setValue:self.commodityCoverImage forKey:kHomeRecommendCommodityCoverImage];

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

    self.commodityDigestTw = [aDecoder decodeObjectForKey:kHomeRecommendCommodityDigestTw];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kHomeRecommendCommoditySerial];
    self.commodityDigestEn = [aDecoder decodeObjectForKey:kHomeRecommendCommodityDigestEn];
    self.commodityNameTw = [aDecoder decodeObjectForKey:kHomeRecommendCommodityNameTw];
    self.commodityName = [aDecoder decodeObjectForKey:kHomeRecommendCommodityName];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kHomeRecommendCommodityImagesPath];
    self.commodityNameEn = [aDecoder decodeObjectForKey:kHomeRecommendCommodityNameEn];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kHomeRecommendCommoditySellprice];
    self.commodityDigest = [aDecoder decodeObjectForKey:kHomeRecommendCommodityDigest];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kHomeRecommendCommodityCoverImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commodityDigestTw forKey:kHomeRecommendCommodityDigestTw];
    [aCoder encodeDouble:_commoditySerial forKey:kHomeRecommendCommoditySerial];
    [aCoder encodeObject:_commodityDigestEn forKey:kHomeRecommendCommodityDigestEn];
    [aCoder encodeObject:_commodityNameTw forKey:kHomeRecommendCommodityNameTw];
    [aCoder encodeObject:_commodityName forKey:kHomeRecommendCommodityName];
    [aCoder encodeObject:_commodityImagesPath forKey:kHomeRecommendCommodityImagesPath];
    [aCoder encodeObject:_commodityNameEn forKey:kHomeRecommendCommodityNameEn];
    [aCoder encodeDouble:_commoditySellprice forKey:kHomeRecommendCommoditySellprice];
    [aCoder encodeObject:_commodityDigest forKey:kHomeRecommendCommodityDigest];
    [aCoder encodeObject:_commodityCoverImage forKey:kHomeRecommendCommodityCoverImage];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeRecommend *copy = [[HomeRecommend alloc] init];
    
    
    
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
