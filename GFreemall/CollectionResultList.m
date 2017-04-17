//
//  CollectionResultList.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CollectionResultList.h"


NSString *const kCollectionResultListId = @"id";
NSString *const kCollectionResultListCommodityCoverImage = @"commodity_cover_image";
NSString *const kCollectionResultListCommoditySerial = @"commodity_serial";
NSString *const kCollectionResultListCommodityName = @"commodity_name";
NSString *const kCollectionResultListCommoditySellprice = @"commodity_sellprice";
NSString *const kCollectionResultListCommodityImagesPath = @"commodity_images_path";


@interface CollectionResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CollectionResultList

@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityName = _commodityName;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize commodityImagesPath = _commodityImagesPath;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.resultListIdentifier = [[self objectOrNilForKey:kCollectionResultListId fromDictionary:dict] doubleValue];
            self.commodityCoverImage = [self objectOrNilForKey:kCollectionResultListCommodityCoverImage fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kCollectionResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kCollectionResultListCommodityName fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kCollectionResultListCommoditySellprice fromDictionary:dict] doubleValue];
            self.commodityImagesPath = [self objectOrNilForKey:kCollectionResultListCommodityImagesPath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kCollectionResultListId];
    [mutableDict setValue:self.commodityCoverImage forKey:kCollectionResultListCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kCollectionResultListCommoditySerial];
    [mutableDict setValue:self.commodityName forKey:kCollectionResultListCommodityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kCollectionResultListCommoditySellprice];
    [mutableDict setValue:self.commodityImagesPath forKey:kCollectionResultListCommodityImagesPath];

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

    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kCollectionResultListId];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kCollectionResultListCommodityCoverImage];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kCollectionResultListCommoditySerial];
    self.commodityName = [aDecoder decodeObjectForKey:kCollectionResultListCommodityName];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kCollectionResultListCommoditySellprice];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kCollectionResultListCommodityImagesPath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_resultListIdentifier forKey:kCollectionResultListId];
    [aCoder encodeObject:_commodityCoverImage forKey:kCollectionResultListCommodityCoverImage];
    [aCoder encodeDouble:_commoditySerial forKey:kCollectionResultListCommoditySerial];
    [aCoder encodeObject:_commodityName forKey:kCollectionResultListCommodityName];
    [aCoder encodeDouble:_commoditySellprice forKey:kCollectionResultListCommoditySellprice];
    [aCoder encodeObject:_commodityImagesPath forKey:kCollectionResultListCommodityImagesPath];
}

- (id)copyWithZone:(NSZone *)zone {
    CollectionResultList *copy = [[CollectionResultList alloc] init];
    
    
    
    if (copy) {

        copy.resultListIdentifier = self.resultListIdentifier;
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
    }
    
    return copy;
}


@end
