//
//  MyInfo.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyInfo.h"


NSString *const kMyInfoId = @"id";
NSString *const kMyInfoBasePhone = @"base_phone";
NSString *const kMyInfoBaseRegisterTime = @"base_register_time";
NSString *const kMyInfoBaseIdcard = @"base_idcard";
NSString *const kMyInfoBaseLastloginIp = @"base_lastlogin_ip";
NSString *const kMyInfoBaseUsername = @"base_username";
NSString *const kMyInfoBaseEmail = @"base_email";
NSString *const kMyInfoBaseCountry = @"base_country";
NSString *const kMyInfoBaseUuid = @"base_uuid";
NSString *const kMyInfoBaseVisitCount = @"base_visit_count";
NSString *const kMyInfoBaseName = @"base_name";
NSString *const kMyInfoBaseLastloginTime = @"base_lastlogin_time";


@interface MyInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyInfo

@synthesize infoIdentifier = _infoIdentifier;
@synthesize basePhone = _basePhone;
@synthesize baseRegisterTime = _baseRegisterTime;
@synthesize baseIdcard = _baseIdcard;
@synthesize baseLastloginIp = _baseLastloginIp;
@synthesize baseUsername = _baseUsername;
@synthesize baseEmail = _baseEmail;
@synthesize baseCountry = _baseCountry;
@synthesize baseUuid = _baseUuid;
@synthesize baseVisitCount = _baseVisitCount;
@synthesize baseName = _baseName;
@synthesize baseLastloginTime = _baseLastloginTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.infoIdentifier = [[self objectOrNilForKey:kMyInfoId fromDictionary:dict] doubleValue];
            self.basePhone = [self objectOrNilForKey:kMyInfoBasePhone fromDictionary:dict];
            self.baseRegisterTime = [self objectOrNilForKey:kMyInfoBaseRegisterTime fromDictionary:dict];
            self.baseIdcard = [self objectOrNilForKey:kMyInfoBaseIdcard fromDictionary:dict];
            self.baseLastloginIp = [self objectOrNilForKey:kMyInfoBaseLastloginIp fromDictionary:dict];
            self.baseUsername = [self objectOrNilForKey:kMyInfoBaseUsername fromDictionary:dict];
            self.baseEmail = [self objectOrNilForKey:kMyInfoBaseEmail fromDictionary:dict];
            self.baseCountry = [self objectOrNilForKey:kMyInfoBaseCountry fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kMyInfoBaseUuid fromDictionary:dict] doubleValue];
            self.baseVisitCount = [[self objectOrNilForKey:kMyInfoBaseVisitCount fromDictionary:dict] doubleValue];
            self.baseName = [self objectOrNilForKey:kMyInfoBaseName fromDictionary:dict];
            self.baseLastloginTime = [[self objectOrNilForKey:kMyInfoBaseLastloginTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.infoIdentifier] forKey:kMyInfoId];
    [mutableDict setValue:self.basePhone forKey:kMyInfoBasePhone];
    [mutableDict setValue:self.baseRegisterTime forKey:kMyInfoBaseRegisterTime];
    [mutableDict setValue:self.baseIdcard forKey:kMyInfoBaseIdcard];
    [mutableDict setValue:self.baseLastloginIp forKey:kMyInfoBaseLastloginIp];
    [mutableDict setValue:self.baseUsername forKey:kMyInfoBaseUsername];
    [mutableDict setValue:self.baseEmail forKey:kMyInfoBaseEmail];
    [mutableDict setValue:self.baseCountry forKey:kMyInfoBaseCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kMyInfoBaseUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseVisitCount] forKey:kMyInfoBaseVisitCount];
    [mutableDict setValue:self.baseName forKey:kMyInfoBaseName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseLastloginTime] forKey:kMyInfoBaseLastloginTime];

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

    self.infoIdentifier = [aDecoder decodeDoubleForKey:kMyInfoId];
    self.basePhone = [aDecoder decodeObjectForKey:kMyInfoBasePhone];
    self.baseRegisterTime = [aDecoder decodeObjectForKey:kMyInfoBaseRegisterTime];
    self.baseIdcard = [aDecoder decodeObjectForKey:kMyInfoBaseIdcard];
    self.baseLastloginIp = [aDecoder decodeObjectForKey:kMyInfoBaseLastloginIp];
    self.baseUsername = [aDecoder decodeObjectForKey:kMyInfoBaseUsername];
    self.baseEmail = [aDecoder decodeObjectForKey:kMyInfoBaseEmail];
    self.baseCountry = [aDecoder decodeObjectForKey:kMyInfoBaseCountry];
    self.baseUuid = [aDecoder decodeDoubleForKey:kMyInfoBaseUuid];
    self.baseVisitCount = [aDecoder decodeDoubleForKey:kMyInfoBaseVisitCount];
    self.baseName = [aDecoder decodeObjectForKey:kMyInfoBaseName];
    self.baseLastloginTime = [aDecoder decodeDoubleForKey:kMyInfoBaseLastloginTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_infoIdentifier forKey:kMyInfoId];
    [aCoder encodeObject:_basePhone forKey:kMyInfoBasePhone];
    [aCoder encodeObject:_baseRegisterTime forKey:kMyInfoBaseRegisterTime];
    [aCoder encodeObject:_baseIdcard forKey:kMyInfoBaseIdcard];
    [aCoder encodeObject:_baseLastloginIp forKey:kMyInfoBaseLastloginIp];
    [aCoder encodeObject:_baseUsername forKey:kMyInfoBaseUsername];
    [aCoder encodeObject:_baseEmail forKey:kMyInfoBaseEmail];
    [aCoder encodeObject:_baseCountry forKey:kMyInfoBaseCountry];
    [aCoder encodeDouble:_baseUuid forKey:kMyInfoBaseUuid];
    [aCoder encodeDouble:_baseVisitCount forKey:kMyInfoBaseVisitCount];
    [aCoder encodeObject:_baseName forKey:kMyInfoBaseName];
    [aCoder encodeDouble:_baseLastloginTime forKey:kMyInfoBaseLastloginTime];
}

- (id)copyWithZone:(NSZone *)zone {
    MyInfo *copy = [[MyInfo alloc] init];
    
    
    
    if (copy) {

        copy.infoIdentifier = self.infoIdentifier;
        copy.basePhone = [self.basePhone copyWithZone:zone];
        copy.baseRegisterTime = [self.baseRegisterTime copyWithZone:zone];
        copy.baseIdcard = [self.baseIdcard copyWithZone:zone];
        copy.baseLastloginIp = [self.baseLastloginIp copyWithZone:zone];
        copy.baseUsername = [self.baseUsername copyWithZone:zone];
        copy.baseEmail = [self.baseEmail copyWithZone:zone];
        copy.baseCountry = [self.baseCountry copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
        copy.baseVisitCount = self.baseVisitCount;
        copy.baseName = [self.baseName copyWithZone:zone];
        copy.baseLastloginTime = self.baseLastloginTime;
    }
    
    return copy;
}


@end
