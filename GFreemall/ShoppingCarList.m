//
//  ShoppingCarList.m
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingCarList.h"
#import "ShoppingCarComm.h"


NSString *const kShoppingCarListCommodityAttributes = @"commodity_attributes";
NSString *const kShoppingCarListId = @"id";
NSString *const kShoppingCarListCount = @"count";
NSString *const kShoppingCarListCommodityId = @"commodity_id";
NSString *const kShoppingCarListCommodityName = @"commodity_name";
NSString *const kShoppingCarListComm = @"comm";


@interface ShoppingCarList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingCarList

@synthesize commodityAttributes = _commodityAttributes;
@synthesize listIdentifier = _listIdentifier;
@synthesize count = _count;
@synthesize commodityId = _commodityId;
@synthesize commodityName = _commodityName;
@synthesize comm = _comm;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commodityAttributes = [self objectOrNilForKey:kShoppingCarListCommodityAttributes fromDictionary:dict];
            self.listIdentifier = [[self objectOrNilForKey:kShoppingCarListId fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kShoppingCarListCount fromDictionary:dict] doubleValue];
            self.commodityId = [[self objectOrNilForKey:kShoppingCarListCommodityId fromDictionary:dict] doubleValue];
            self.commodityName = [self objectOrNilForKey:kShoppingCarListCommodityName fromDictionary:dict];
            self.comm = [ShoppingCarComm modelObjectWithDictionary:[dict objectForKey:kShoppingCarListComm]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commodityAttributes forKey:kShoppingCarListCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kShoppingCarListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kShoppingCarListCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityId] forKey:kShoppingCarListCommodityId];
    [mutableDict setValue:self.commodityName forKey:kShoppingCarListCommodityName];
    [mutableDict setValue:[self.comm dictionaryRepresentation] forKey:kShoppingCarListComm];

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

    self.commodityAttributes = [aDecoder decodeObjectForKey:kShoppingCarListCommodityAttributes];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kShoppingCarListId];
    self.count = [aDecoder decodeDoubleForKey:kShoppingCarListCount];
    self.commodityId = [aDecoder decodeDoubleForKey:kShoppingCarListCommodityId];
    self.commodityName = [aDecoder decodeObjectForKey:kShoppingCarListCommodityName];
    self.comm = [aDecoder decodeObjectForKey:kShoppingCarListComm];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commodityAttributes forKey:kShoppingCarListCommodityAttributes];
    [aCoder encodeDouble:_listIdentifier forKey:kShoppingCarListId];
    [aCoder encodeDouble:_count forKey:kShoppingCarListCount];
    [aCoder encodeDouble:_commodityId forKey:kShoppingCarListCommodityId];
    [aCoder encodeObject:_commodityName forKey:kShoppingCarListCommodityName];
    [aCoder encodeObject:_comm forKey:kShoppingCarListComm];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingCarList *copy = [[ShoppingCarList alloc] init];
    
    
    
    if (copy) {

        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.listIdentifier = self.listIdentifier;
        copy.count = self.count;
        copy.commodityId = self.commodityId;
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.comm = [self.comm copyWithZone:zone];
    }
    
    return copy;
}


@end
