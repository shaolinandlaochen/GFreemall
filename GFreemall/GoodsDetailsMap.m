//
//  GoodsDetailsMap.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsMap.h"


NSString *const kGoodsDetailsMapCategorySerial = @"category_serial";
NSString *const kGoodsDetailsMapId = @"id";
NSString *const kGoodsDetailsMapCategoryName = @"category_name";
NSString *const kGoodsDetailsMapCategoryPid = @"category_pid";
NSString *const kGoodsDetailsMapFirstName = @"first_name";


@interface GoodsDetailsMap ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsMap

@synthesize categorySerial = _categorySerial;
@synthesize mapIdentifier = _mapIdentifier;
@synthesize categoryName = _categoryName;
@synthesize categoryPid = _categoryPid;
@synthesize firstName = _firstName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.categorySerial = [[self objectOrNilForKey:kGoodsDetailsMapCategorySerial fromDictionary:dict] doubleValue];
            self.mapIdentifier = [[self objectOrNilForKey:kGoodsDetailsMapId fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kGoodsDetailsMapCategoryName fromDictionary:dict];
            self.categoryPid = [[self objectOrNilForKey:kGoodsDetailsMapCategoryPid fromDictionary:dict] doubleValue];
            self.firstName = [self objectOrNilForKey:kGoodsDetailsMapFirstName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kGoodsDetailsMapCategorySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mapIdentifier] forKey:kGoodsDetailsMapId];
    [mutableDict setValue:self.categoryName forKey:kGoodsDetailsMapCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryPid] forKey:kGoodsDetailsMapCategoryPid];
    [mutableDict setValue:self.firstName forKey:kGoodsDetailsMapFirstName];

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

    self.categorySerial = [aDecoder decodeDoubleForKey:kGoodsDetailsMapCategorySerial];
    self.mapIdentifier = [aDecoder decodeDoubleForKey:kGoodsDetailsMapId];
    self.categoryName = [aDecoder decodeObjectForKey:kGoodsDetailsMapCategoryName];
    self.categoryPid = [aDecoder decodeDoubleForKey:kGoodsDetailsMapCategoryPid];
    self.firstName = [aDecoder decodeObjectForKey:kGoodsDetailsMapFirstName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_categorySerial forKey:kGoodsDetailsMapCategorySerial];
    [aCoder encodeDouble:_mapIdentifier forKey:kGoodsDetailsMapId];
    [aCoder encodeObject:_categoryName forKey:kGoodsDetailsMapCategoryName];
    [aCoder encodeDouble:_categoryPid forKey:kGoodsDetailsMapCategoryPid];
    [aCoder encodeObject:_firstName forKey:kGoodsDetailsMapFirstName];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetailsMap *copy = [[GoodsDetailsMap alloc] init];
    
    
    
    if (copy) {

        copy.categorySerial = self.categorySerial;
        copy.mapIdentifier = self.mapIdentifier;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.categoryPid = self.categoryPid;
        copy.firstName = [self.firstName copyWithZone:zone];
    }
    
    return copy;
}


@end
