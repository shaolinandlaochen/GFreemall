//
//  AddressList.m
//
//  Created by   on 2017/4/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AddressList.h"


NSString *const kAddressListAddressPhone = @"address_phone";
NSString *const kAddressListAddressCity = @"address_city";
NSString *const kAddressListAddressArea = @"address_area";
NSString *const kAddressListId = @"id";
NSString *const kAddressListAddressAddress = @"address_address";
NSString *const kAddressListAddressProvince = @"address_province";
NSString *const kAddressListAddressName = @"address_name";
NSString *const kAddressListAddressZipcode = @"address_zipcode";
NSString *const kAddressListAddressCountry = @"address_country";
NSString *const kAddressListAddressIsdefault = @"address_isdefault";


@interface AddressList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AddressList

@synthesize addressPhone = _addressPhone;
@synthesize addressCity = _addressCity;
@synthesize addressArea = _addressArea;
@synthesize listIdentifier = _listIdentifier;
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
            self.addressPhone = [self objectOrNilForKey:kAddressListAddressPhone fromDictionary:dict];
            self.addressCity = [self objectOrNilForKey:kAddressListAddressCity fromDictionary:dict];
            self.addressArea = [self objectOrNilForKey:kAddressListAddressArea fromDictionary:dict];
            self.listIdentifier = [[self objectOrNilForKey:kAddressListId fromDictionary:dict] doubleValue];
            self.addressAddress = [self objectOrNilForKey:kAddressListAddressAddress fromDictionary:dict];
            self.addressProvince = [self objectOrNilForKey:kAddressListAddressProvince fromDictionary:dict];
            self.addressName = [self objectOrNilForKey:kAddressListAddressName fromDictionary:dict];
            self.addressZipcode = [self objectOrNilForKey:kAddressListAddressZipcode fromDictionary:dict];
            self.addressCountry = [self objectOrNilForKey:kAddressListAddressCountry fromDictionary:dict];
            self.addressIsdefault = [[self objectOrNilForKey:kAddressListAddressIsdefault fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.addressPhone forKey:kAddressListAddressPhone];
    [mutableDict setValue:self.addressCity forKey:kAddressListAddressCity];
    [mutableDict setValue:self.addressArea forKey:kAddressListAddressArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kAddressListId];
    [mutableDict setValue:self.addressAddress forKey:kAddressListAddressAddress];
    [mutableDict setValue:self.addressProvince forKey:kAddressListAddressProvince];
    [mutableDict setValue:self.addressName forKey:kAddressListAddressName];
    [mutableDict setValue:self.addressZipcode forKey:kAddressListAddressZipcode];
    [mutableDict setValue:self.addressCountry forKey:kAddressListAddressCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addressIsdefault] forKey:kAddressListAddressIsdefault];

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

    self.addressPhone = [aDecoder decodeObjectForKey:kAddressListAddressPhone];
    self.addressCity = [aDecoder decodeObjectForKey:kAddressListAddressCity];
    self.addressArea = [aDecoder decodeObjectForKey:kAddressListAddressArea];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kAddressListId];
    self.addressAddress = [aDecoder decodeObjectForKey:kAddressListAddressAddress];
    self.addressProvince = [aDecoder decodeObjectForKey:kAddressListAddressProvince];
    self.addressName = [aDecoder decodeObjectForKey:kAddressListAddressName];
    self.addressZipcode = [aDecoder decodeObjectForKey:kAddressListAddressZipcode];
    self.addressCountry = [aDecoder decodeObjectForKey:kAddressListAddressCountry];
    self.addressIsdefault = [aDecoder decodeDoubleForKey:kAddressListAddressIsdefault];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_addressPhone forKey:kAddressListAddressPhone];
    [aCoder encodeObject:_addressCity forKey:kAddressListAddressCity];
    [aCoder encodeObject:_addressArea forKey:kAddressListAddressArea];
    [aCoder encodeDouble:_listIdentifier forKey:kAddressListId];
    [aCoder encodeObject:_addressAddress forKey:kAddressListAddressAddress];
    [aCoder encodeObject:_addressProvince forKey:kAddressListAddressProvince];
    [aCoder encodeObject:_addressName forKey:kAddressListAddressName];
    [aCoder encodeObject:_addressZipcode forKey:kAddressListAddressZipcode];
    [aCoder encodeObject:_addressCountry forKey:kAddressListAddressCountry];
    [aCoder encodeDouble:_addressIsdefault forKey:kAddressListAddressIsdefault];
}

- (id)copyWithZone:(NSZone *)zone {
    AddressList *copy = [[AddressList alloc] init];
    
    
    
    if (copy) {

        copy.addressPhone = [self.addressPhone copyWithZone:zone];
        copy.addressCity = [self.addressCity copyWithZone:zone];
        copy.addressArea = [self.addressArea copyWithZone:zone];
        copy.listIdentifier = self.listIdentifier;
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
