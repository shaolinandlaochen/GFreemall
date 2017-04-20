//
//  ShoppingSettlementMapAddress.m
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingSettlementMapAddress.h"


NSString *const kShoppingSettlementMapAddressAddressPhone = @"address_phone";
NSString *const kShoppingSettlementMapAddressAddressCity = @"address_city";
NSString *const kShoppingSettlementMapAddressAddressArea = @"address_area";
NSString *const kShoppingSettlementMapAddressId = @"id";
NSString *const kShoppingSettlementMapAddressAddressAddress = @"address_address";
NSString *const kShoppingSettlementMapAddressAddressProvince = @"address_province";
NSString *const kShoppingSettlementMapAddressAddressName = @"address_name";
NSString *const kShoppingSettlementMapAddressAddressZipcode = @"address_zipcode";
NSString *const kShoppingSettlementMapAddressAddressCountry = @"address_country";
NSString *const kShoppingSettlementMapAddressAddressIsdefault = @"address_isdefault";


@interface ShoppingSettlementMapAddress ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingSettlementMapAddress

@synthesize addressPhone = _addressPhone;
@synthesize addressCity = _addressCity;
@synthesize addressArea = _addressArea;
@synthesize mapAddressIdentifier = _mapAddressIdentifier;
@synthesize addressAddress = _addressAddress;
@synthesize addressProvince = _addressProvince;
@synthesize addressName = _addressName;
@synthesize addressZipcode = _addressZipcode;
@synthesize addressCountry = _addressCountry;
@synthesize addressIsdefault = _addressIsdefault;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.addressPhone = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressPhone fromDictionary:dict];
            self.addressCity = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressCity fromDictionary:dict];
            self.addressArea = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressArea fromDictionary:dict];
            self.mapAddressIdentifier = [[self objectOrNilForKey:kShoppingSettlementMapAddressId fromDictionary:dict] doubleValue];
            self.addressAddress = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressAddress fromDictionary:dict];
            self.addressProvince = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressProvince fromDictionary:dict];
            self.addressName = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressName fromDictionary:dict];
            self.addressZipcode = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressZipcode fromDictionary:dict];
            self.addressCountry = [self objectOrNilForKey:kShoppingSettlementMapAddressAddressCountry fromDictionary:dict];
            self.addressIsdefault = [[self objectOrNilForKey:kShoppingSettlementMapAddressAddressIsdefault fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.addressPhone forKey:kShoppingSettlementMapAddressAddressPhone];
    [mutableDict setValue:self.addressCity forKey:kShoppingSettlementMapAddressAddressCity];
    [mutableDict setValue:self.addressArea forKey:kShoppingSettlementMapAddressAddressArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mapAddressIdentifier] forKey:kShoppingSettlementMapAddressId];
    [mutableDict setValue:self.addressAddress forKey:kShoppingSettlementMapAddressAddressAddress];
    [mutableDict setValue:self.addressProvince forKey:kShoppingSettlementMapAddressAddressProvince];
    [mutableDict setValue:self.addressName forKey:kShoppingSettlementMapAddressAddressName];
    [mutableDict setValue:self.addressZipcode forKey:kShoppingSettlementMapAddressAddressZipcode];
    [mutableDict setValue:self.addressCountry forKey:kShoppingSettlementMapAddressAddressCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressIsdefault] forKey:kShoppingSettlementMapAddressAddressIsdefault];

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

    self.addressPhone = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressPhone];
    self.addressCity = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressCity];
    self.addressArea = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressArea];
    self.mapAddressIdentifier = [aDecoder decodeDoubleForKey:kShoppingSettlementMapAddressId];
    self.addressAddress = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressAddress];
    self.addressProvince = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressProvince];
    self.addressName = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressName];
    self.addressZipcode = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressZipcode];
    self.addressCountry = [aDecoder decodeObjectForKey:kShoppingSettlementMapAddressAddressCountry];
    self.addressIsdefault = [aDecoder decodeDoubleForKey:kShoppingSettlementMapAddressAddressIsdefault];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_addressPhone forKey:kShoppingSettlementMapAddressAddressPhone];
    [aCoder encodeObject:_addressCity forKey:kShoppingSettlementMapAddressAddressCity];
    [aCoder encodeObject:_addressArea forKey:kShoppingSettlementMapAddressAddressArea];
    [aCoder encodeDouble:_mapAddressIdentifier forKey:kShoppingSettlementMapAddressId];
    [aCoder encodeObject:_addressAddress forKey:kShoppingSettlementMapAddressAddressAddress];
    [aCoder encodeObject:_addressProvince forKey:kShoppingSettlementMapAddressAddressProvince];
    [aCoder encodeObject:_addressName forKey:kShoppingSettlementMapAddressAddressName];
    [aCoder encodeObject:_addressZipcode forKey:kShoppingSettlementMapAddressAddressZipcode];
    [aCoder encodeObject:_addressCountry forKey:kShoppingSettlementMapAddressAddressCountry];
    [aCoder encodeDouble:_addressIsdefault forKey:kShoppingSettlementMapAddressAddressIsdefault];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingSettlementMapAddress *copy = [[ShoppingSettlementMapAddress alloc] init];
    
    
    
    if (copy) {

        copy.addressPhone = [self.addressPhone copyWithZone:zone];
        copy.addressCity = [self.addressCity copyWithZone:zone];
        copy.addressArea = [self.addressArea copyWithZone:zone];
        copy.mapAddressIdentifier = self.mapAddressIdentifier;
        copy.addressAddress = [self.addressAddress copyWithZone:zone];
        copy.addressProvince = [self.addressProvince copyWithZone:zone];
        copy.addressName = [self.addressName copyWithZone:zone];
        copy.addressZipcode = [self.addressZipcode copyWithZone:zone];
        copy.addressCountry = [self.addressCountry copyWithZone:zone];
        copy.addressIsdefault = self.addressIsdefault;
    }
    
    return copy;
}


@end
