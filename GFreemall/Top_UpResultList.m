//
//  Top_UpResultList.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Top_UpResultList.h"


NSString *const kTop_UpResultListRemark = @"remark";
NSString *const kTop_UpResultListRechargeAmountRmb = @"recharge_amount_rmb";
NSString *const kTop_UpResultListRechargeState = @"recharge_state";
NSString *const kTop_UpResultListRechargeCurrency = @"recharge_currency";
NSString *const kTop_UpResultListRechargeSerial = @"recharge_serial";
NSString *const kTop_UpResultListBaseUuid = @"base_uuid";
NSString *const kTop_UpResultListRechargeAmount = @"recharge_amount";
NSString *const kTop_UpResultListRechargeTime = @"recharge_time";


@interface Top_UpResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top_UpResultList

@synthesize remark = _remark;
@synthesize rechargeAmountRmb = _rechargeAmountRmb;
@synthesize rechargeState = _rechargeState;
@synthesize rechargeCurrency = _rechargeCurrency;
@synthesize rechargeSerial = _rechargeSerial;
@synthesize baseUuid = _baseUuid;
@synthesize rechargeAmount = _rechargeAmount;
@synthesize rechargeTime = _rechargeTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.remark = [self objectOrNilForKey:kTop_UpResultListRemark fromDictionary:dict];
            self.rechargeAmountRmb = [[self objectOrNilForKey:kTop_UpResultListRechargeAmountRmb fromDictionary:dict] doubleValue];
            self.rechargeState = [[self objectOrNilForKey:kTop_UpResultListRechargeState fromDictionary:dict] doubleValue];
            self.rechargeCurrency = [self objectOrNilForKey:kTop_UpResultListRechargeCurrency fromDictionary:dict];
            self.rechargeSerial = [self objectOrNilForKey:kTop_UpResultListRechargeSerial fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kTop_UpResultListBaseUuid fromDictionary:dict] doubleValue];
            self.rechargeAmount = [[self objectOrNilForKey:kTop_UpResultListRechargeAmount fromDictionary:dict] doubleValue];
            self.rechargeTime = [self objectOrNilForKey:kTop_UpResultListRechargeTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.remark forKey:kTop_UpResultListRemark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rechargeAmountRmb] forKey:kTop_UpResultListRechargeAmountRmb];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rechargeState] forKey:kTop_UpResultListRechargeState];
    [mutableDict setValue:self.rechargeCurrency forKey:kTop_UpResultListRechargeCurrency];
    [mutableDict setValue:self.rechargeSerial forKey:kTop_UpResultListRechargeSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kTop_UpResultListBaseUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rechargeAmount] forKey:kTop_UpResultListRechargeAmount];
    [mutableDict setValue:self.rechargeTime forKey:kTop_UpResultListRechargeTime];

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

    self.remark = [aDecoder decodeObjectForKey:kTop_UpResultListRemark];
    self.rechargeAmountRmb = [aDecoder decodeDoubleForKey:kTop_UpResultListRechargeAmountRmb];
    self.rechargeState = [aDecoder decodeDoubleForKey:kTop_UpResultListRechargeState];
    self.rechargeCurrency = [aDecoder decodeObjectForKey:kTop_UpResultListRechargeCurrency];
    self.rechargeSerial = [aDecoder decodeObjectForKey:kTop_UpResultListRechargeSerial];
    self.baseUuid = [aDecoder decodeDoubleForKey:kTop_UpResultListBaseUuid];
    self.rechargeAmount = [aDecoder decodeDoubleForKey:kTop_UpResultListRechargeAmount];
    self.rechargeTime = [aDecoder decodeObjectForKey:kTop_UpResultListRechargeTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_remark forKey:kTop_UpResultListRemark];
    [aCoder encodeDouble:_rechargeAmountRmb forKey:kTop_UpResultListRechargeAmountRmb];
    [aCoder encodeDouble:_rechargeState forKey:kTop_UpResultListRechargeState];
    [aCoder encodeObject:_rechargeCurrency forKey:kTop_UpResultListRechargeCurrency];
    [aCoder encodeObject:_rechargeSerial forKey:kTop_UpResultListRechargeSerial];
    [aCoder encodeDouble:_baseUuid forKey:kTop_UpResultListBaseUuid];
    [aCoder encodeDouble:_rechargeAmount forKey:kTop_UpResultListRechargeAmount];
    [aCoder encodeObject:_rechargeTime forKey:kTop_UpResultListRechargeTime];
}

- (id)copyWithZone:(NSZone *)zone {
    Top_UpResultList *copy = [[Top_UpResultList alloc] init];
    
    
    
    if (copy) {

        copy.remark = [self.remark copyWithZone:zone];
        copy.rechargeAmountRmb = self.rechargeAmountRmb;
        copy.rechargeState = self.rechargeState;
        copy.rechargeCurrency = [self.rechargeCurrency copyWithZone:zone];
        copy.rechargeSerial = [self.rechargeSerial copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
        copy.rechargeAmount = self.rechargeAmount;
        copy.rechargeTime = [self.rechargeTime copyWithZone:zone];
    }
    
    return copy;
}


@end
