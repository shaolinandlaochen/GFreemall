//
//  SearchResultList.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SearchResultList.h"


NSString *const kSearchResultListId = @"id";
NSString *const kSearchResultListCommodityImagesPath = @"commodity_images_path";
NSString *const kSearchResultListCommodityName = @"commodity_name";
NSString *const kSearchResultListCommoditySerial = @"commodity_serial";
NSString *const kSearchResultListCommodityDigest = @"commodity_digest";
NSString *const kSearchResultListCommodityCoverImage = @"commodity_cover_image";
NSString *const kSearchResultListCommodityLookcount = @"commodity_lookcount";
NSString *const kSearchResultListCommodityNameTw = @"commodity_name_tw";
NSString *const kSearchResultListCommodityDigestTw = @"commodity_digest_tw";
NSString *const kSearchResultListCommoditySellprice = @"commodity_sellprice";
NSString *const kSearchResultListCommodityDigestEn = @"commodity_digest_en";
NSString *const kSearchResultListCommodityNameEn = @"commodity_name_en";
NSString *const kSearchResultListCommodityGrade = @"commodity_grade";


@interface SearchResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SearchResultList

@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityName = _commodityName;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityDigest = _commodityDigest;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commodityLookcount = _commodityLookcount;
@synthesize commodityNameTw = _commodityNameTw;
@synthesize commodityDigestTw = _commodityDigestTw;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityDigestEn = _commodityDigestEn;
@synthesize commodityNameEn = _commodityNameEn;
@synthesize commodityGrade = _commodityGrade;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.resultListIdentifier = [[self objectOrNilForKey:kSearchResultListId fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kSearchResultListCommodityImagesPath fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kSearchResultListCommodityName fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kSearchResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kSearchResultListCommodityDigest fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kSearchResultListCommodityCoverImage fromDictionary:dict];
            self.commodityLookcount = [[self objectOrNilForKey:kSearchResultListCommodityLookcount fromDictionary:dict] doubleValue];
            self.commodityNameTw = [self objectOrNilForKey:kSearchResultListCommodityNameTw fromDictionary:dict];
            self.commodityDigestTw = [self objectOrNilForKey:kSearchResultListCommodityDigestTw fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kSearchResultListCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityDigestEn = [self objectOrNilForKey:kSearchResultListCommodityDigestEn fromDictionary:dict];
            self.commodityNameEn = [self objectOrNilForKey:kSearchResultListCommodityNameEn fromDictionary:dict];
            self.commodityGrade = [[self objectOrNilForKey:kSearchResultListCommodityGrade fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kSearchResultListId];
    [mutableDict setValue:self.commodityImagesPath forKey:kSearchResultListCommodityImagesPath];
    [mutableDict setValue:self.commodityName forKey:kSearchResultListCommodityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kSearchResultListCommoditySerial];
    [mutableDict setValue:self.commodityDigest forKey:kSearchResultListCommodityDigest];
    [mutableDict setValue:self.commodityCoverImage forKey:kSearchResultListCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityLookcount] forKey:kSearchResultListCommodityLookcount];
    [mutableDict setValue:self.commodityNameTw forKey:kSearchResultListCommodityNameTw];
    [mutableDict setValue:self.commodityDigestTw forKey:kSearchResultListCommodityDigestTw];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kSearchResultListCommoditySellprice];
    [mutableDict setValue:self.commodityDigestEn forKey:kSearchResultListCommodityDigestEn];
    [mutableDict setValue:self.commodityNameEn forKey:kSearchResultListCommodityNameEn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityGrade] forKey:kSearchResultListCommodityGrade];

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

    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kSearchResultListId];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kSearchResultListCommodityImagesPath];
    self.commodityName = [aDecoder decodeObjectForKey:kSearchResultListCommodityName];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kSearchResultListCommoditySerial];
    self.commodityDigest = [aDecoder decodeObjectForKey:kSearchResultListCommodityDigest];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kSearchResultListCommodityCoverImage];
    self.commodityLookcount = [aDecoder decodeDoubleForKey:kSearchResultListCommodityLookcount];
    self.commodityNameTw = [aDecoder decodeObjectForKey:kSearchResultListCommodityNameTw];
    self.commodityDigestTw = [aDecoder decodeObjectForKey:kSearchResultListCommodityDigestTw];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kSearchResultListCommoditySellprice];
    self.commodityDigestEn = [aDecoder decodeObjectForKey:kSearchResultListCommodityDigestEn];
    self.commodityNameEn = [aDecoder decodeObjectForKey:kSearchResultListCommodityNameEn];
    self.commodityGrade = [aDecoder decodeDoubleForKey:kSearchResultListCommodityGrade];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_resultListIdentifier forKey:kSearchResultListId];
    [aCoder encodeObject:_commodityImagesPath forKey:kSearchResultListCommodityImagesPath];
    [aCoder encodeObject:_commodityName forKey:kSearchResultListCommodityName];
    [aCoder encodeDouble:_commoditySerial forKey:kSearchResultListCommoditySerial];
    [aCoder encodeObject:_commodityDigest forKey:kSearchResultListCommodityDigest];
    [aCoder encodeObject:_commodityCoverImage forKey:kSearchResultListCommodityCoverImage];
    [aCoder encodeDouble:_commodityLookcount forKey:kSearchResultListCommodityLookcount];
    [aCoder encodeObject:_commodityNameTw forKey:kSearchResultListCommodityNameTw];
    [aCoder encodeObject:_commodityDigestTw forKey:kSearchResultListCommodityDigestTw];
    [aCoder encodeDouble:_commoditySellprice forKey:kSearchResultListCommoditySellprice];
    [aCoder encodeObject:_commodityDigestEn forKey:kSearchResultListCommodityDigestEn];
    [aCoder encodeObject:_commodityNameEn forKey:kSearchResultListCommodityNameEn];
    [aCoder encodeDouble:_commodityGrade forKey:kSearchResultListCommodityGrade];
}

- (id)copyWithZone:(NSZone *)zone {
    SearchResultList *copy = [[SearchResultList alloc] init];
    
    
    
    if (copy) {

        copy.resultListIdentifier = self.resultListIdentifier;
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodityDigest = [self.commodityDigest copyWithZone:zone];
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commodityLookcount = self.commodityLookcount;
        copy.commodityNameTw = [self.commodityNameTw copyWithZone:zone];
        copy.commodityDigestTw = [self.commodityDigestTw copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityDigestEn = [self.commodityDigestEn copyWithZone:zone];
        copy.commodityNameEn = [self.commodityNameEn copyWithZone:zone];
        copy.commodityGrade = self.commodityGrade;
    }
    
    return copy;
}


@end
