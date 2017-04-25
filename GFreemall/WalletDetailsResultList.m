//
//  WalletDetailsResultList.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "WalletDetailsResultList.h"


NSString *const kWalletDetailsResultListCwalletRemain = @"cwallet_remain";
NSString *const kWalletDetailsResultListCwalletAmount = @"cwallet_amount";
NSString *const kWalletDetailsResultListCwalletTime = @"cwallet_time";
NSString *const kWalletDetailsResultListId = @"id";
NSString *const kWalletDetailsResultListRemark = @"remark";
NSString *const kWalletDetailsResultListBaseUuid = @"base_uuid";
NSString *const kWalletDetailsResultListCwalletType = @"cwallet_type";


@interface WalletDetailsResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WalletDetailsResultList

@synthesize cwalletRemain = _cwalletRemain;
@synthesize cwalletAmount = _cwalletAmount;
@synthesize cwalletTime = _cwalletTime;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize remark = _remark;
@synthesize baseUuid = _baseUuid;
@synthesize cwalletType = _cwalletType;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cwalletRemain = [[self objectOrNilForKey:kWalletDetailsResultListCwalletRemain fromDictionary:dict] doubleValue];
            self.cwalletAmount = [[self objectOrNilForKey:kWalletDetailsResultListCwalletAmount fromDictionary:dict] doubleValue];
            self.cwalletTime = [self objectOrNilForKey:kWalletDetailsResultListCwalletTime fromDictionary:dict];
            self.resultListIdentifier = [[self objectOrNilForKey:kWalletDetailsResultListId fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:kWalletDetailsResultListRemark fromDictionary:dict];
            self.baseUuid = [[self objectOrNilForKey:kWalletDetailsResultListBaseUuid fromDictionary:dict] doubleValue];
            self.cwalletType = [self objectOrNilForKey:kWalletDetailsResultListCwalletType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cwalletRemain] forKey:kWalletDetailsResultListCwalletRemain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cwalletAmount] forKey:kWalletDetailsResultListCwalletAmount];
    [mutableDict setValue:self.cwalletTime forKey:kWalletDetailsResultListCwalletTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kWalletDetailsResultListId];
    [mutableDict setValue:self.remark forKey:kWalletDetailsResultListRemark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kWalletDetailsResultListBaseUuid];
    [mutableDict setValue:self.cwalletType forKey:kWalletDetailsResultListCwalletType];

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

    self.cwalletRemain = [aDecoder decodeDoubleForKey:kWalletDetailsResultListCwalletRemain];
    self.cwalletAmount = [aDecoder decodeDoubleForKey:kWalletDetailsResultListCwalletAmount];
    self.cwalletTime = [aDecoder decodeObjectForKey:kWalletDetailsResultListCwalletTime];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kWalletDetailsResultListId];
    self.remark = [aDecoder decodeObjectForKey:kWalletDetailsResultListRemark];
    self.baseUuid = [aDecoder decodeDoubleForKey:kWalletDetailsResultListBaseUuid];
    self.cwalletType = [aDecoder decodeObjectForKey:kWalletDetailsResultListCwalletType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cwalletRemain forKey:kWalletDetailsResultListCwalletRemain];
    [aCoder encodeDouble:_cwalletAmount forKey:kWalletDetailsResultListCwalletAmount];
    [aCoder encodeObject:_cwalletTime forKey:kWalletDetailsResultListCwalletTime];
    [aCoder encodeDouble:_resultListIdentifier forKey:kWalletDetailsResultListId];
    [aCoder encodeObject:_remark forKey:kWalletDetailsResultListRemark];
    [aCoder encodeDouble:_baseUuid forKey:kWalletDetailsResultListBaseUuid];
    [aCoder encodeObject:_cwalletType forKey:kWalletDetailsResultListCwalletType];
}

- (id)copyWithZone:(NSZone *)zone {
    WalletDetailsResultList *copy = [[WalletDetailsResultList alloc] init];
    
    
    
    if (copy) {

        copy.cwalletRemain = self.cwalletRemain;
        copy.cwalletAmount = self.cwalletAmount;
        copy.cwalletTime = [self.cwalletTime copyWithZone:zone];
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.remark = [self.remark copyWithZone:zone];
        copy.baseUuid = self.baseUuid;
        copy.cwalletType = [self.cwalletType copyWithZone:zone];
    }
    
    return copy;
}


@end
