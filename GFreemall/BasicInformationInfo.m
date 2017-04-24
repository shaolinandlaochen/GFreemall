//
//  BasicInformationInfo.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BasicInformationInfo.h"


NSString *const kBasicInformationInfoBaseCountry = @"base_country";
NSString *const kBasicInformationInfoBaseVisitCount = @"base_visit_count";
NSString *const kBasicInformationInfoBaseAuthEmail = @"base_auth_email";
NSString *const kBasicInformationInfoBaseGrade = @"base_grade";
NSString *const kBasicInformationInfoBaseState = @"base_state";
NSString *const kBasicInformationInfoBaseRegisterTime = @"base_register_time";
NSString *const kBasicInformationInfoBaseAuthName = @"base_auth_name";
NSString *const kBasicInformationInfoBaseIsshareholder = @"base_isshareholder";
NSString *const kBasicInformationInfoBaseErrorIsfive = @"base_error_isfive";
NSString *const kBasicInformationInfoBaseUsername = @"base_username";
NSString *const kBasicInformationInfoBaseAuthPwd = @"base_auth_pwd";
NSString *const kBasicInformationInfoBaseIdcard = @"base_idcard";
NSString *const kBasicInformationInfoBaseName = @"base_name";
NSString *const kBasicInformationInfoBaseLastloginTime = @"base_lastlogin_time";
NSString *const kBasicInformationInfoBaseAuthPhone = @"base_auth_phone";
NSString *const kBasicInformationInfoBaseLastloginIp = @"base_lastlogin_ip";
NSString *const kBasicInformationInfoId = @"id";
NSString *const kBasicInformationInfoBasePhone = @"base_phone";
NSString *const kBasicInformationInfoBaseEmail = @"base_email";
NSString *const kBasicInformationInfoBaseUuid = @"base_uuid";


@interface BasicInformationInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BasicInformationInfo

@synthesize baseCountry = _baseCountry;
@synthesize baseVisitCount = _baseVisitCount;
@synthesize baseAuthEmail = _baseAuthEmail;
@synthesize baseGrade = _baseGrade;
@synthesize baseState = _baseState;
@synthesize baseRegisterTime = _baseRegisterTime;
@synthesize baseAuthName = _baseAuthName;
@synthesize baseIsshareholder = _baseIsshareholder;
@synthesize baseErrorIsfive = _baseErrorIsfive;
@synthesize baseUsername = _baseUsername;
@synthesize baseAuthPwd = _baseAuthPwd;
@synthesize baseIdcard = _baseIdcard;
@synthesize baseName = _baseName;
@synthesize baseLastloginTime = _baseLastloginTime;
@synthesize baseAuthPhone = _baseAuthPhone;
@synthesize baseLastloginIp = _baseLastloginIp;
@synthesize infoIdentifier = _infoIdentifier;
@synthesize basePhone = _basePhone;
@synthesize baseEmail = _baseEmail;
@synthesize baseUuid = _baseUuid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.baseCountry = [self objectOrNilForKey:kBasicInformationInfoBaseCountry fromDictionary:dict];
            self.baseVisitCount = [[self objectOrNilForKey:kBasicInformationInfoBaseVisitCount fromDictionary:dict] doubleValue];
            self.baseAuthEmail = [[self objectOrNilForKey:kBasicInformationInfoBaseAuthEmail fromDictionary:dict] doubleValue];
            self.baseGrade = [[self objectOrNilForKey:kBasicInformationInfoBaseGrade fromDictionary:dict] doubleValue];
            self.baseState = [[self objectOrNilForKey:kBasicInformationInfoBaseState fromDictionary:dict] doubleValue];
            self.baseRegisterTime = [self objectOrNilForKey:kBasicInformationInfoBaseRegisterTime fromDictionary:dict];
            self.baseAuthName = [[self objectOrNilForKey:kBasicInformationInfoBaseAuthName fromDictionary:dict] doubleValue];
            self.baseIsshareholder = [[self objectOrNilForKey:kBasicInformationInfoBaseIsshareholder fromDictionary:dict] doubleValue];
            self.baseErrorIsfive = [[self objectOrNilForKey:kBasicInformationInfoBaseErrorIsfive fromDictionary:dict] doubleValue];
            self.baseUsername = [self objectOrNilForKey:kBasicInformationInfoBaseUsername fromDictionary:dict];
            self.baseAuthPwd = [[self objectOrNilForKey:kBasicInformationInfoBaseAuthPwd fromDictionary:dict] doubleValue];
            self.baseIdcard = [self objectOrNilForKey:kBasicInformationInfoBaseIdcard fromDictionary:dict];
            self.baseName = [self objectOrNilForKey:kBasicInformationInfoBaseName fromDictionary:dict];
            self.baseLastloginTime = [[self objectOrNilForKey:kBasicInformationInfoBaseLastloginTime fromDictionary:dict] doubleValue];
            self.baseAuthPhone = [[self objectOrNilForKey:kBasicInformationInfoBaseAuthPhone fromDictionary:dict] doubleValue];
            self.baseLastloginIp = [self objectOrNilForKey:kBasicInformationInfoBaseLastloginIp fromDictionary:dict];
            self.infoIdentifier = [[self objectOrNilForKey:kBasicInformationInfoId fromDictionary:dict] doubleValue];
            self.basePhone = [self objectOrNilForKey:kBasicInformationInfoBasePhone fromDictionary:dict];
            self.baseEmail = [self objectOrNilForKey:kBasicInformationInfoBaseEmail fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kBasicInformationInfoBaseUuid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.baseCountry forKey:kBasicInformationInfoBaseCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseVisitCount] forKey:kBasicInformationInfoBaseVisitCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseAuthEmail] forKey:kBasicInformationInfoBaseAuthEmail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseGrade] forKey:kBasicInformationInfoBaseGrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseState] forKey:kBasicInformationInfoBaseState];
    [mutableDict setValue:self.baseRegisterTime forKey:kBasicInformationInfoBaseRegisterTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseAuthName] forKey:kBasicInformationInfoBaseAuthName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseIsshareholder] forKey:kBasicInformationInfoBaseIsshareholder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseErrorIsfive] forKey:kBasicInformationInfoBaseErrorIsfive];
    [mutableDict setValue:self.baseUsername forKey:kBasicInformationInfoBaseUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseAuthPwd] forKey:kBasicInformationInfoBaseAuthPwd];
    [mutableDict setValue:self.baseIdcard forKey:kBasicInformationInfoBaseIdcard];
    [mutableDict setValue:self.baseName forKey:kBasicInformationInfoBaseName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseLastloginTime] forKey:kBasicInformationInfoBaseLastloginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseAuthPhone] forKey:kBasicInformationInfoBaseAuthPhone];
    [mutableDict setValue:self.baseLastloginIp forKey:kBasicInformationInfoBaseLastloginIp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.infoIdentifier] forKey:kBasicInformationInfoId];
    [mutableDict setValue:self.basePhone forKey:kBasicInformationInfoBasePhone];
    [mutableDict setValue:self.baseEmail forKey:kBasicInformationInfoBaseEmail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kBasicInformationInfoBaseUuid];

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

    self.baseCountry = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseCountry];
    self.baseVisitCount = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseVisitCount];
    self.baseAuthEmail = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseAuthEmail];
    self.baseGrade = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseGrade];
    self.baseState = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseState];
    self.baseRegisterTime = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseRegisterTime];
    self.baseAuthName = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseAuthName];
    self.baseIsshareholder = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseIsshareholder];
    self.baseErrorIsfive = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseErrorIsfive];
    self.baseUsername = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseUsername];
    self.baseAuthPwd = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseAuthPwd];
    self.baseIdcard = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseIdcard];
    self.baseName = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseName];
    self.baseLastloginTime = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseLastloginTime];
    self.baseAuthPhone = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseAuthPhone];
    self.baseLastloginIp = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseLastloginIp];
    self.infoIdentifier = [aDecoder decodeDoubleForKey:kBasicInformationInfoId];
    self.basePhone = [aDecoder decodeObjectForKey:kBasicInformationInfoBasePhone];
    self.baseEmail = [aDecoder decodeObjectForKey:kBasicInformationInfoBaseEmail];
    self.baseUuid = [aDecoder decodeDoubleForKey:kBasicInformationInfoBaseUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_baseCountry forKey:kBasicInformationInfoBaseCountry];
    [aCoder encodeDouble:_baseVisitCount forKey:kBasicInformationInfoBaseVisitCount];
    [aCoder encodeDouble:_baseAuthEmail forKey:kBasicInformationInfoBaseAuthEmail];
    [aCoder encodeDouble:_baseGrade forKey:kBasicInformationInfoBaseGrade];
    [aCoder encodeDouble:_baseState forKey:kBasicInformationInfoBaseState];
    [aCoder encodeObject:_baseRegisterTime forKey:kBasicInformationInfoBaseRegisterTime];
    [aCoder encodeDouble:_baseAuthName forKey:kBasicInformationInfoBaseAuthName];
    [aCoder encodeDouble:_baseIsshareholder forKey:kBasicInformationInfoBaseIsshareholder];
    [aCoder encodeDouble:_baseErrorIsfive forKey:kBasicInformationInfoBaseErrorIsfive];
    [aCoder encodeObject:_baseUsername forKey:kBasicInformationInfoBaseUsername];
    [aCoder encodeDouble:_baseAuthPwd forKey:kBasicInformationInfoBaseAuthPwd];
    [aCoder encodeObject:_baseIdcard forKey:kBasicInformationInfoBaseIdcard];
    [aCoder encodeObject:_baseName forKey:kBasicInformationInfoBaseName];
    [aCoder encodeDouble:_baseLastloginTime forKey:kBasicInformationInfoBaseLastloginTime];
    [aCoder encodeDouble:_baseAuthPhone forKey:kBasicInformationInfoBaseAuthPhone];
    [aCoder encodeObject:_baseLastloginIp forKey:kBasicInformationInfoBaseLastloginIp];
    [aCoder encodeDouble:_infoIdentifier forKey:kBasicInformationInfoId];
    [aCoder encodeObject:_basePhone forKey:kBasicInformationInfoBasePhone];
    [aCoder encodeObject:_baseEmail forKey:kBasicInformationInfoBaseEmail];
    [aCoder encodeDouble:_baseUuid forKey:kBasicInformationInfoBaseUuid];
}

- (id)copyWithZone:(NSZone *)zone {
    BasicInformationInfo *copy = [[BasicInformationInfo alloc] init];
    
    
    
    if (copy) {

        copy.baseCountry = [self.baseCountry copyWithZone:zone];
        copy.baseVisitCount = self.baseVisitCount;
        copy.baseAuthEmail = self.baseAuthEmail;
        copy.baseGrade = self.baseGrade;
        copy.baseState = self.baseState;
        copy.baseRegisterTime = [self.baseRegisterTime copyWithZone:zone];
        copy.baseAuthName = self.baseAuthName;
        copy.baseIsshareholder = self.baseIsshareholder;
        copy.baseErrorIsfive = self.baseErrorIsfive;
        copy.baseUsername = [self.baseUsername copyWithZone:zone];
        copy.baseAuthPwd = self.baseAuthPwd;
        copy.baseIdcard = [self.baseIdcard copyWithZone:zone];
        copy.baseName = [self.baseName copyWithZone:zone];
        copy.baseLastloginTime = self.baseLastloginTime;
        copy.baseAuthPhone = self.baseAuthPhone;
        copy.baseLastloginIp = [self.baseLastloginIp copyWithZone:zone];
        copy.infoIdentifier = self.infoIdentifier;
        copy.basePhone = [self.basePhone copyWithZone:zone];
        copy.baseEmail = [self.baseEmail copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
    }
    
    return copy;
}


@end
