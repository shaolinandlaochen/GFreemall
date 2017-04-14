//
//  ForCategoricalDataSecondNav.m
//
//  Created by   on 2017/4/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForCategoricalDataSecondNav.h"


NSString *const kForCategoricalDataSecondNavCategoryPid = @"category_pid";
NSString *const kForCategoricalDataSecondNavCategoryNameEn = @"category_name_en";
NSString *const kForCategoricalDataSecondNavCategoryNameTw = @"category_name_tw";
NSString *const kForCategoricalDataSecondNavCommodityImagesPath = @"commodity_images_path";
NSString *const kForCategoricalDataSecondNavCommodityName = @"commodity_name";
NSString *const kForCategoricalDataSecondNavCommoditySerial = @"commodity_serial";
NSString *const kForCategoricalDataSecondNavCommodityDigest = @"commodity_digest";
NSString *const kForCategoricalDataSecondNavCommodityCoverImage = @"commodity_cover_image";
NSString *const kForCategoricalDataSecondNavCategorySort = @"category_sort";
NSString *const kForCategoricalDataSecondNavCategorySerial = @"category_serial";
NSString *const kForCategoricalDataSecondNavCategoryName = @"category_name";
NSString *const kForCategoricalDataSecondNavCommodityNameEn = @"commodity_name_en";
NSString *const kForCategoricalDataSecondNavCommodityNameTw = @"commodity_name_tw";
NSString *const kForCategoricalDataSecondNavCommodityDigestEn = @"commodity_digest_en";
NSString *const kForCategoricalDataSecondNavCommodityDigestTw = @"commodity_digest_tw";


@interface ForCategoricalDataSecondNav ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForCategoricalDataSecondNav

@synthesize categoryPid = _categoryPid;
@synthesize categoryNameEn = _categoryNameEn;
@synthesize categoryNameTw = _categoryNameTw;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityName = _commodityName;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityDigest = _commodityDigest;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize categorySort = _categorySort;
@synthesize categorySerial = _categorySerial;
@synthesize categoryName = _categoryName;
@synthesize commodityNameEn = _commodityNameEn;
@synthesize commodityNameTw = _commodityNameTw;
@synthesize commodityDigestEn = _commodityDigestEn;
@synthesize commodityDigestTw = _commodityDigestTw;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.categoryPid = [[self objectOrNilForKey:kForCategoricalDataSecondNavCategoryPid fromDictionary:dict] doubleValue];
            self.categoryNameEn = [self objectOrNilForKey:kForCategoricalDataSecondNavCategoryNameEn fromDictionary:dict];
            self.categoryNameTw = [self objectOrNilForKey:kForCategoricalDataSecondNavCategoryNameTw fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityImagesPath fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityName fromDictionary:dict];
            self.commoditySerial = [self objectOrNilForKey:kForCategoricalDataSecondNavCommoditySerial fromDictionary:dict];
            self.commodityDigest = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityDigest fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityCoverImage fromDictionary:dict];
            self.categorySort = [[self objectOrNilForKey:kForCategoricalDataSecondNavCategorySort fromDictionary:dict] doubleValue];
            self.categorySerial = [[self objectOrNilForKey:kForCategoricalDataSecondNavCategorySerial fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kForCategoricalDataSecondNavCategoryName fromDictionary:dict];
            self.commodityNameEn = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityNameEn fromDictionary:dict];
            self.commodityNameTw = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityNameTw fromDictionary:dict];
            self.commodityDigestEn = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityDigestEn fromDictionary:dict];
            self.commodityDigestTw = [self objectOrNilForKey:kForCategoricalDataSecondNavCommodityDigestTw fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryPid] forKey:kForCategoricalDataSecondNavCategoryPid];
    [mutableDict setValue:self.categoryNameEn forKey:kForCategoricalDataSecondNavCategoryNameEn];
    [mutableDict setValue:self.categoryNameTw forKey:kForCategoricalDataSecondNavCategoryNameTw];
    [mutableDict setValue:self.commodityImagesPath forKey:kForCategoricalDataSecondNavCommodityImagesPath];
    [mutableDict setValue:self.commodityName forKey:kForCategoricalDataSecondNavCommodityName];
    [mutableDict setValue:self.commoditySerial forKey:kForCategoricalDataSecondNavCommoditySerial];
    [mutableDict setValue:self.commodityDigest forKey:kForCategoricalDataSecondNavCommodityDigest];
    [mutableDict setValue:self.commodityCoverImage forKey:kForCategoricalDataSecondNavCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySort] forKey:kForCategoricalDataSecondNavCategorySort];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kForCategoricalDataSecondNavCategorySerial];
    [mutableDict setValue:self.categoryName forKey:kForCategoricalDataSecondNavCategoryName];
    [mutableDict setValue:self.commodityNameEn forKey:kForCategoricalDataSecondNavCommodityNameEn];
    [mutableDict setValue:self.commodityNameTw forKey:kForCategoricalDataSecondNavCommodityNameTw];
    [mutableDict setValue:self.commodityDigestEn forKey:kForCategoricalDataSecondNavCommodityDigestEn];
    [mutableDict setValue:self.commodityDigestTw forKey:kForCategoricalDataSecondNavCommodityDigestTw];

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

    self.categoryPid = [aDecoder decodeDoubleForKey:kForCategoricalDataSecondNavCategoryPid];
    self.categoryNameEn = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCategoryNameEn];
    self.categoryNameTw = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCategoryNameTw];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityImagesPath];
    self.commodityName = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityName];
    self.commoditySerial = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommoditySerial];
    self.commodityDigest = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityDigest];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityCoverImage];
    self.categorySort = [aDecoder decodeDoubleForKey:kForCategoricalDataSecondNavCategorySort];
    self.categorySerial = [aDecoder decodeDoubleForKey:kForCategoricalDataSecondNavCategorySerial];
    self.categoryName = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCategoryName];
    self.commodityNameEn = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityNameEn];
    self.commodityNameTw = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityNameTw];
    self.commodityDigestEn = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityDigestEn];
    self.commodityDigestTw = [aDecoder decodeObjectForKey:kForCategoricalDataSecondNavCommodityDigestTw];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_categoryPid forKey:kForCategoricalDataSecondNavCategoryPid];
    [aCoder encodeObject:_categoryNameEn forKey:kForCategoricalDataSecondNavCategoryNameEn];
    [aCoder encodeObject:_categoryNameTw forKey:kForCategoricalDataSecondNavCategoryNameTw];
    [aCoder encodeObject:_commodityImagesPath forKey:kForCategoricalDataSecondNavCommodityImagesPath];
    [aCoder encodeObject:_commodityName forKey:kForCategoricalDataSecondNavCommodityName];
    [aCoder encodeObject:_commoditySerial forKey:kForCategoricalDataSecondNavCommoditySerial];
    [aCoder encodeObject:_commodityDigest forKey:kForCategoricalDataSecondNavCommodityDigest];
    [aCoder encodeObject:_commodityCoverImage forKey:kForCategoricalDataSecondNavCommodityCoverImage];
    [aCoder encodeDouble:_categorySort forKey:kForCategoricalDataSecondNavCategorySort];
    [aCoder encodeDouble:_categorySerial forKey:kForCategoricalDataSecondNavCategorySerial];
    [aCoder encodeObject:_categoryName forKey:kForCategoricalDataSecondNavCategoryName];
    [aCoder encodeObject:_commodityNameEn forKey:kForCategoricalDataSecondNavCommodityNameEn];
    [aCoder encodeObject:_commodityNameTw forKey:kForCategoricalDataSecondNavCommodityNameTw];
    [aCoder encodeObject:_commodityDigestEn forKey:kForCategoricalDataSecondNavCommodityDigestEn];
    [aCoder encodeObject:_commodityDigestTw forKey:kForCategoricalDataSecondNavCommodityDigestTw];
}

- (id)copyWithZone:(NSZone *)zone {
    ForCategoricalDataSecondNav *copy = [[ForCategoricalDataSecondNav alloc] init];
    
    
    
    if (copy) {

        copy.categoryPid = self.categoryPid;
        copy.categoryNameEn = [self.categoryNameEn copyWithZone:zone];
        copy.categoryNameTw = [self.categoryNameTw copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commoditySerial = [self.commoditySerial copyWithZone:zone];
        copy.commodityDigest = [self.commodityDigest copyWithZone:zone];
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.categorySort = self.categorySort;
        copy.categorySerial = self.categorySerial;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.commodityNameEn = [self.commodityNameEn copyWithZone:zone];
        copy.commodityNameTw = [self.commodityNameTw copyWithZone:zone];
        copy.commodityDigestEn = [self.commodityDigestEn copyWithZone:zone];
        copy.commodityDigestTw = [self.commodityDigestTw copyWithZone:zone];
    }
    
    return copy;
}


@end
