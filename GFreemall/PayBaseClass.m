//
//  PayBaseClass.m
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "PayBaseClass.h"


NSString *const kPayBaseClassCode = @"code";
NSString *const kPayBaseClassPayType = @"pay_type";
NSString *const kPayBaseClassImgSrc = @"imgSrc";
NSString *const kPayBaseClassMsg = @"msg";
NSString *const kPayBaseClassAmountTotal = @"amountTotal";
NSString *const kPayBaseClassSerial = @"serial";


@interface PayBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayBaseClass

@synthesize code = _code;
@synthesize payType = _payType;
@synthesize imgSrc = _imgSrc;
@synthesize msg = _msg;
@synthesize amountTotal = _amountTotal;
@synthesize serial = _serial;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kPayBaseClassCode fromDictionary:dict];
            self.payType = [self objectOrNilForKey:kPayBaseClassPayType fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kPayBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kPayBaseClassMsg fromDictionary:dict];
            self.amountTotal = [self objectOrNilForKey:kPayBaseClassAmountTotal fromDictionary:dict];
            self.serial = [self objectOrNilForKey:kPayBaseClassSerial fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kPayBaseClassCode];
    [mutableDict setValue:self.payType forKey:kPayBaseClassPayType];
    [mutableDict setValue:self.imgSrc forKey:kPayBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kPayBaseClassMsg];
    [mutableDict setValue:self.amountTotal forKey:kPayBaseClassAmountTotal];
    [mutableDict setValue:self.serial forKey:kPayBaseClassSerial];

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

    self.code = [aDecoder decodeObjectForKey:kPayBaseClassCode];
    self.payType = [aDecoder decodeObjectForKey:kPayBaseClassPayType];
    self.imgSrc = [aDecoder decodeObjectForKey:kPayBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kPayBaseClassMsg];
    self.amountTotal = [aDecoder decodeObjectForKey:kPayBaseClassAmountTotal];
    self.serial = [aDecoder decodeObjectForKey:kPayBaseClassSerial];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kPayBaseClassCode];
    [aCoder encodeObject:_payType forKey:kPayBaseClassPayType];
    [aCoder encodeObject:_imgSrc forKey:kPayBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kPayBaseClassMsg];
    [aCoder encodeObject:_amountTotal forKey:kPayBaseClassAmountTotal];
    [aCoder encodeObject:_serial forKey:kPayBaseClassSerial];
}

- (id)copyWithZone:(NSZone *)zone {
    PayBaseClass *copy = [[PayBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.payType = [self.payType copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.amountTotal = [self.amountTotal copyWithZone:zone];
        copy.serial = [self.serial copyWithZone:zone];
    }
    
    return copy;
}


@end
