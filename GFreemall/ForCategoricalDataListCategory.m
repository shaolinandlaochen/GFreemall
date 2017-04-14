//
//  ForCategoricalDataListCategory.m
//
//  Created by   on 2017/4/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForCategoricalDataListCategory.h"
#import "ForCategoricalDataSecondNav.h"


NSString *const kForCategoricalDataListCategoryCategoryPid = @"category_pid";
NSString *const kForCategoricalDataListCategorySecondNav = @"second_nav";
NSString *const kForCategoricalDataListCategoryCategoryNameEn = @"category_name_en";
NSString *const kForCategoricalDataListCategoryCategoryNameTw = @"category_name_tw";
NSString *const kForCategoricalDataListCategoryCommodityImagesPath = @"commodity_images_path";
NSString *const kForCategoricalDataListCategoryCommodityName = @"commodity_name";
NSString *const kForCategoricalDataListCategoryCommoditySerial = @"commodity_serial";
NSString *const kForCategoricalDataListCategoryCommodityDigest = @"commodity_digest";
NSString *const kForCategoricalDataListCategoryRecommendBrands = @"recommend_brands";
NSString *const kForCategoricalDataListCategoryCommodityCoverImage = @"commodity_cover_image";
NSString *const kForCategoricalDataListCategoryCategorySerial = @"category_serial";
NSString *const kForCategoricalDataListCategoryCategorySort = @"category_sort";
NSString *const kForCategoricalDataListCategoryCategoryName = @"category_name";
NSString *const kForCategoricalDataListCategoryCommodityNameEn = @"commodity_name_en";
NSString *const kForCategoricalDataListCategoryCommodityNameTw = @"commodity_name_tw";
NSString *const kForCategoricalDataListCategoryCommodityDigestEn = @"commodity_digest_en";
NSString *const kForCategoricalDataListCategoryCommodityDigestTw = @"commodity_digest_tw";


@interface ForCategoricalDataListCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForCategoricalDataListCategory

@synthesize categoryPid = _categoryPid;
@synthesize secondNav = _secondNav;
@synthesize categoryNameEn = _categoryNameEn;
@synthesize categoryNameTw = _categoryNameTw;
@synthesize commodityImagesPath = _commodityImagesPath;
@synthesize commodityName = _commodityName;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodityDigest = _commodityDigest;
@synthesize recommendBrands = _recommendBrands;
@synthesize commodityCoverImage = _commodityCoverImage;
@synthesize categorySerial = _categorySerial;
@synthesize categorySort = _categorySort;
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
            self.categoryPid = [[self objectOrNilForKey:kForCategoricalDataListCategoryCategoryPid fromDictionary:dict] doubleValue];
    NSObject *receivedForCategoricalDataSecondNav = [dict objectForKey:kForCategoricalDataListCategorySecondNav];
    NSMutableArray *parsedForCategoricalDataSecondNav = [NSMutableArray array];
    
    if ([receivedForCategoricalDataSecondNav isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForCategoricalDataSecondNav) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForCategoricalDataSecondNav addObject:[ForCategoricalDataSecondNav modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForCategoricalDataSecondNav isKindOfClass:[NSDictionary class]]) {
       [parsedForCategoricalDataSecondNav addObject:[ForCategoricalDataSecondNav modelObjectWithDictionary:(NSDictionary *)receivedForCategoricalDataSecondNav]];
    }

    self.secondNav = [NSArray arrayWithArray:parsedForCategoricalDataSecondNav];
            self.categoryNameEn = [self objectOrNilForKey:kForCategoricalDataListCategoryCategoryNameEn fromDictionary:dict];
            self.categoryNameTw = [self objectOrNilForKey:kForCategoricalDataListCategoryCategoryNameTw fromDictionary:dict];
            self.commodityImagesPath = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityImagesPath fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityName fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kForCategoricalDataListCategoryCommoditySerial fromDictionary:dict] doubleValue];
            self.commodityDigest = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityDigest fromDictionary:dict];
            self.recommendBrands = [self objectOrNilForKey:kForCategoricalDataListCategoryRecommendBrands fromDictionary:dict];
            self.commodityCoverImage = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityCoverImage fromDictionary:dict];
            self.categorySerial = [[self objectOrNilForKey:kForCategoricalDataListCategoryCategorySerial fromDictionary:dict] doubleValue];
            self.categorySort = [[self objectOrNilForKey:kForCategoricalDataListCategoryCategorySort fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kForCategoricalDataListCategoryCategoryName fromDictionary:dict];
            self.commodityNameEn = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityNameEn fromDictionary:dict];
            self.commodityNameTw = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityNameTw fromDictionary:dict];
            self.commodityDigestEn = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityDigestEn fromDictionary:dict];
            self.commodityDigestTw = [self objectOrNilForKey:kForCategoricalDataListCategoryCommodityDigestTw fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryPid] forKey:kForCategoricalDataListCategoryCategoryPid];
    NSMutableArray *tempArrayForSecondNav = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.secondNav) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSecondNav addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSecondNav addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSecondNav] forKey:kForCategoricalDataListCategorySecondNav];
    [mutableDict setValue:self.categoryNameEn forKey:kForCategoricalDataListCategoryCategoryNameEn];
    [mutableDict setValue:self.categoryNameTw forKey:kForCategoricalDataListCategoryCategoryNameTw];
    [mutableDict setValue:self.commodityImagesPath forKey:kForCategoricalDataListCategoryCommodityImagesPath];
    [mutableDict setValue:self.commodityName forKey:kForCategoricalDataListCategoryCommodityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kForCategoricalDataListCategoryCommoditySerial];
    [mutableDict setValue:self.commodityDigest forKey:kForCategoricalDataListCategoryCommodityDigest];
    NSMutableArray *tempArrayForRecommendBrands = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.recommendBrands) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecommendBrands addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecommendBrands addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecommendBrands] forKey:kForCategoricalDataListCategoryRecommendBrands];
    [mutableDict setValue:self.commodityCoverImage forKey:kForCategoricalDataListCategoryCommodityCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kForCategoricalDataListCategoryCategorySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySort] forKey:kForCategoricalDataListCategoryCategorySort];
    [mutableDict setValue:self.categoryName forKey:kForCategoricalDataListCategoryCategoryName];
    [mutableDict setValue:self.commodityNameEn forKey:kForCategoricalDataListCategoryCommodityNameEn];
    [mutableDict setValue:self.commodityNameTw forKey:kForCategoricalDataListCategoryCommodityNameTw];
    [mutableDict setValue:self.commodityDigestEn forKey:kForCategoricalDataListCategoryCommodityDigestEn];
    [mutableDict setValue:self.commodityDigestTw forKey:kForCategoricalDataListCategoryCommodityDigestTw];

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

    self.categoryPid = [aDecoder decodeDoubleForKey:kForCategoricalDataListCategoryCategoryPid];
    self.secondNav = [aDecoder decodeObjectForKey:kForCategoricalDataListCategorySecondNav];
    self.categoryNameEn = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCategoryNameEn];
    self.categoryNameTw = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCategoryNameTw];
    self.commodityImagesPath = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityImagesPath];
    self.commodityName = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityName];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kForCategoricalDataListCategoryCommoditySerial];
    self.commodityDigest = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityDigest];
    self.recommendBrands = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryRecommendBrands];
    self.commodityCoverImage = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityCoverImage];
    self.categorySerial = [aDecoder decodeDoubleForKey:kForCategoricalDataListCategoryCategorySerial];
    self.categorySort = [aDecoder decodeDoubleForKey:kForCategoricalDataListCategoryCategorySort];
    self.categoryName = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCategoryName];
    self.commodityNameEn = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityNameEn];
    self.commodityNameTw = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityNameTw];
    self.commodityDigestEn = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityDigestEn];
    self.commodityDigestTw = [aDecoder decodeObjectForKey:kForCategoricalDataListCategoryCommodityDigestTw];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_categoryPid forKey:kForCategoricalDataListCategoryCategoryPid];
    [aCoder encodeObject:_secondNav forKey:kForCategoricalDataListCategorySecondNav];
    [aCoder encodeObject:_categoryNameEn forKey:kForCategoricalDataListCategoryCategoryNameEn];
    [aCoder encodeObject:_categoryNameTw forKey:kForCategoricalDataListCategoryCategoryNameTw];
    [aCoder encodeObject:_commodityImagesPath forKey:kForCategoricalDataListCategoryCommodityImagesPath];
    [aCoder encodeObject:_commodityName forKey:kForCategoricalDataListCategoryCommodityName];
    [aCoder encodeDouble:_commoditySerial forKey:kForCategoricalDataListCategoryCommoditySerial];
    [aCoder encodeObject:_commodityDigest forKey:kForCategoricalDataListCategoryCommodityDigest];
    [aCoder encodeObject:_recommendBrands forKey:kForCategoricalDataListCategoryRecommendBrands];
    [aCoder encodeObject:_commodityCoverImage forKey:kForCategoricalDataListCategoryCommodityCoverImage];
    [aCoder encodeDouble:_categorySerial forKey:kForCategoricalDataListCategoryCategorySerial];
    [aCoder encodeDouble:_categorySort forKey:kForCategoricalDataListCategoryCategorySort];
    [aCoder encodeObject:_categoryName forKey:kForCategoricalDataListCategoryCategoryName];
    [aCoder encodeObject:_commodityNameEn forKey:kForCategoricalDataListCategoryCommodityNameEn];
    [aCoder encodeObject:_commodityNameTw forKey:kForCategoricalDataListCategoryCommodityNameTw];
    [aCoder encodeObject:_commodityDigestEn forKey:kForCategoricalDataListCategoryCommodityDigestEn];
    [aCoder encodeObject:_commodityDigestTw forKey:kForCategoricalDataListCategoryCommodityDigestTw];
}

- (id)copyWithZone:(NSZone *)zone {
    ForCategoricalDataListCategory *copy = [[ForCategoricalDataListCategory alloc] init];
    
    
    
    if (copy) {

        copy.categoryPid = self.categoryPid;
        copy.secondNav = [self.secondNav copyWithZone:zone];
        copy.categoryNameEn = [self.categoryNameEn copyWithZone:zone];
        copy.categoryNameTw = [self.categoryNameTw copyWithZone:zone];
        copy.commodityImagesPath = [self.commodityImagesPath copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodityDigest = [self.commodityDigest copyWithZone:zone];
        copy.recommendBrands = [self.recommendBrands copyWithZone:zone];
        copy.commodityCoverImage = [self.commodityCoverImage copyWithZone:zone];
        copy.categorySerial = self.categorySerial;
        copy.categorySort = self.categorySort;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.commodityNameEn = [self.commodityNameEn copyWithZone:zone];
        copy.commodityNameTw = [self.commodityNameTw copyWithZone:zone];
        copy.commodityDigestEn = [self.commodityDigestEn copyWithZone:zone];
        copy.commodityDigestTw = [self.commodityDigestTw copyWithZone:zone];
    }
    
    return copy;
}


@end
