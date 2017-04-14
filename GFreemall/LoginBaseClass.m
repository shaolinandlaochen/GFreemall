//
//  LoginBaseClass.m
//
//  Created by   on 2017/4/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LoginBaseClass.h"


NSString *const kLoginBaseClassToken = @"token";
NSString *const kLoginBaseClassMsg = @"msg";
NSString *const kLoginBaseClassCode = @"code";


@interface LoginBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginBaseClass

@synthesize token = _token;
@synthesize msg = _msg;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.token = [self objectOrNilForKey:kLoginBaseClassToken fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kLoginBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kLoginBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.token forKey:kLoginBaseClassToken];
    [mutableDict setValue:self.msg forKey:kLoginBaseClassMsg];
    [mutableDict setValue:self.code forKey:kLoginBaseClassCode];

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

    self.token = [aDecoder decodeObjectForKey:kLoginBaseClassToken];
    self.msg = [aDecoder decodeObjectForKey:kLoginBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kLoginBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_token forKey:kLoginBaseClassToken];
    [aCoder encodeObject:_msg forKey:kLoginBaseClassMsg];
    [aCoder encodeObject:_code forKey:kLoginBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    LoginBaseClass *copy = [[LoginBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.token = [self.token copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
