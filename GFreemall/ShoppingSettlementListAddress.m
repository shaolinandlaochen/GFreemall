//
//  ShoppingSettlementListAddress.m
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingSettlementListAddress.h"


NSString *const kShoppingSettlementListAddressAddressPhone = @"address_phone";
NSString *const kShoppingSettlementListAddressAddressCity = @"address_city";
NSString *const kShoppingSettlementListAddressAddressArea = @"address_area";
NSString *const kShoppingSettlementListAddressId = @"id";
NSString *const kShoppingSettlementListAddressAddressAddress = @"address_address";
NSString *const kShoppingSettlementListAddressAddressProvince = @"address_province";
NSString *const kShoppingSettlementListAddressAddressName = @"address_name";
NSString *const kShoppingSettlementListAddressAddressZipcode = @"address_zipcode";
NSString *const kShoppingSettlementListAddressAddressCountry = @"address_country";
NSString *const kShoppingSettlementListAddressAddressIsdefault = @"address_isdefault";


@interface ShoppingSettlementListAddress ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingSettlementListAddress

@synthesize addressPhone = _addressPhone;
@synthesize addressCity = _addressCity;
@synthesize addressArea = _addressArea;
@synthesize listAddressIdentifier = _listAddressIdentifier;
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
            self.addressPhone = [self objectOrNilForKey:kShoppingSettlementListAddressAddressPhone fromDictionary:dict];
            self.addressCity = [self objectOrNilForKey:kShoppingSettlementListAddressAddressCity fromDictionary:dict];
            self.addressArea = [self objectOrNilForKey:kShoppingSettlementListAddressAddressArea fromDictionary:dict];
            self.listAddressIdentifier = [[self objectOrNilForKey:kShoppingSettlementListAddressId fromDictionary:dict] doubleValue];
            self.addressAddress = [self objectOrNilForKey:kShoppingSettlementListAddressAddressAddress fromDictionary:dict];
            self.addressProvince = [self objectOrNilForKey:kShoppingSettlementListAddressAddressProvince fromDictionary:dict];
            self.addressName = [self objectOrNilForKey:kShoppingSettlementListAddressAddressName fromDictionary:dict];
            self.addressZipcode = [self objectOrNilForKey:kShoppingSettlementListAddressAddressZipcode fromDictionary:dict];
            self.addressCountry = [self objectOrNilForKey:kShoppingSettlementListAddressAddressCountry fromDictionary:dict];
            self.addressIsdefault = [[self objectOrNilForKey:kShoppingSettlementListAddressAddressIsdefault fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.addressPhone forKey:kShoppingSettlementListAddressAddressPhone];
    [mutableDict setValue:self.addressCity forKey:kShoppingSettlementListAddressAddressCity];
    [mutableDict setValue:self.addressArea forKey:kShoppingSettlementListAddressAddressArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listAddressIdentifier] forKey:kShoppingSettlementListAddressId];
    [mutableDict setValue:self.addressAddress forKey:kShoppingSettlementListAddressAddressAddress];
    [mutableDict setValue:self.addressProvince forKey:kShoppingSettlementListAddressAddressProvince];
    [mutableDict setValue:self.addressName forKey:kShoppingSettlementListAddressAddressName];
    [mutableDict setValue:self.addressZipcode forKey:kShoppingSettlementListAddressAddressZipcode];
    [mutableDict setValue:self.addressCountry forKey:kShoppingSettlementListAddressAddressCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressIsdefault] forKey:kShoppingSettlementListAddressAddressIsdefault];

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

    self.addressPhone = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressPhone];
    self.addressCity = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressCity];
    self.addressArea = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressArea];
    self.listAddressIdentifier = [aDecoder decodeDoubleForKey:kShoppingSettlementListAddressId];
    self.addressAddress = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressAddress];
    self.addressProvince = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressProvince];
    self.addressName = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressName];
    self.addressZipcode = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressZipcode];
    self.addressCountry = [aDecoder decodeObjectForKey:kShoppingSettlementListAddressAddressCountry];
    self.addressIsdefault = [aDecoder decodeDoubleForKey:kShoppingSettlementListAddressAddressIsdefault];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_addressPhone forKey:kShoppingSettlementListAddressAddressPhone];
    [aCoder encodeObject:_addressCity forKey:kShoppingSettlementListAddressAddressCity];
    [aCoder encodeObject:_addressArea forKey:kShoppingSettlementListAddressAddressArea];
    [aCoder encodeDouble:_listAddressIdentifier forKey:kShoppingSettlementListAddressId];
    [aCoder encodeObject:_addressAddress forKey:kShoppingSettlementListAddressAddressAddress];
    [aCoder encodeObject:_addressProvince forKey:kShoppingSettlementListAddressAddressProvince];
    [aCoder encodeObject:_addressName forKey:kShoppingSettlementListAddressAddressName];
    [aCoder encodeObject:_addressZipcode forKey:kShoppingSettlementListAddressAddressZipcode];
    [aCoder encodeObject:_addressCountry forKey:kShoppingSettlementListAddressAddressCountry];
    [aCoder encodeDouble:_addressIsdefault forKey:kShoppingSettlementListAddressAddressIsdefault];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingSettlementListAddress *copy = [[ShoppingSettlementListAddress alloc] init];
    
    
    
    if (copy) {

        copy.addressPhone = [self.addressPhone copyWithZone:zone];
        copy.addressCity = [self.addressCity copyWithZone:zone];
        copy.addressArea = [self.addressArea copyWithZone:zone];
        copy.listAddressIdentifier = self.listAddressIdentifier;
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
