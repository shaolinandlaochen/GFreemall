//
//  ShoppingSettlementBaseClass.m
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingSettlementBaseClass.h"
#import "ShoppingSettlementListAddress.h"
#import "ShoppingSettlementMapAddress.h"
#import "ShoppingSettlementList.h"


NSString *const kShoppingSettlementBaseClassAmountTotal = @"amountTotal";
NSString *const kShoppingSettlementBaseClassListAddressCount = @"listAddressCount";
NSString *const kShoppingSettlementBaseClassAmount = @"amount";
NSString *const kShoppingSettlementBaseClassCount = @"count";
NSString *const kShoppingSettlementBaseClassListAddress = @"listAddress";
NSString *const kShoppingSettlementBaseClassImgSrc = @"imgSrc";
NSString *const kShoppingSettlementBaseClassSettleType = @"settleType";
NSString *const kShoppingSettlementBaseClassFreight = @"freight";
NSString *const kShoppingSettlementBaseClassMapAddress = @"mapAddress";
NSString *const kShoppingSettlementBaseClassCode = @"code";
NSString *const kShoppingSettlementBaseClassCommBox = @"commBox";
NSString *const kShoppingSettlementBaseClassDisamount = @"disamount";
NSString *const kShoppingSettlementBaseClassList = @"list";
NSString *const kShoppingSettlementBaseClassMsg = @"msg";
NSString *const kShoppingSettlementBaseClassCremain = @"cremain";


@interface ShoppingSettlementBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingSettlementBaseClass

@synthesize amountTotal = _amountTotal;
@synthesize listAddressCount = _listAddressCount;
@synthesize amount = _amount;
@synthesize count = _count;
@synthesize listAddress = _listAddress;
@synthesize imgSrc = _imgSrc;
@synthesize settleType = _settleType;
@synthesize freight = _freight;
@synthesize mapAddress = _mapAddress;
@synthesize code = _code;
@synthesize commBox = _commBox;
@synthesize disamount = _disamount;
@synthesize list = _list;
@synthesize msg = _msg;
@synthesize cremain = _cremain;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amountTotal = [[self objectOrNilForKey:kShoppingSettlementBaseClassAmountTotal fromDictionary:dict] doubleValue];
            self.listAddressCount = [[self objectOrNilForKey:kShoppingSettlementBaseClassListAddressCount fromDictionary:dict] doubleValue];
            self.amount = [[self objectOrNilForKey:kShoppingSettlementBaseClassAmount fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kShoppingSettlementBaseClassCount fromDictionary:dict] doubleValue];
    NSObject *receivedShoppingSettlementListAddress = [dict objectForKey:kShoppingSettlementBaseClassListAddress];
    NSMutableArray *parsedShoppingSettlementListAddress = [NSMutableArray array];
    
    if ([receivedShoppingSettlementListAddress isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedShoppingSettlementListAddress) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedShoppingSettlementListAddress addObject:[ShoppingSettlementListAddress modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedShoppingSettlementListAddress isKindOfClass:[NSDictionary class]]) {
       [parsedShoppingSettlementListAddress addObject:[ShoppingSettlementListAddress modelObjectWithDictionary:(NSDictionary *)receivedShoppingSettlementListAddress]];
    }

    self.listAddress = [NSArray arrayWithArray:parsedShoppingSettlementListAddress];
            self.imgSrc = [self objectOrNilForKey:kShoppingSettlementBaseClassImgSrc fromDictionary:dict];
            self.settleType = [self objectOrNilForKey:kShoppingSettlementBaseClassSettleType fromDictionary:dict];
            self.freight = [[self objectOrNilForKey:kShoppingSettlementBaseClassFreight fromDictionary:dict] doubleValue];
            self.mapAddress = [ShoppingSettlementMapAddress modelObjectWithDictionary:[dict objectForKey:kShoppingSettlementBaseClassMapAddress]];
            self.code = [self objectOrNilForKey:kShoppingSettlementBaseClassCode fromDictionary:dict];
            self.commBox = [self objectOrNilForKey:kShoppingSettlementBaseClassCommBox fromDictionary:dict];
            self.disamount = [[self objectOrNilForKey:kShoppingSettlementBaseClassDisamount fromDictionary:dict] doubleValue];
    NSObject *receivedShoppingSettlementList = [dict objectForKey:kShoppingSettlementBaseClassList];
    NSMutableArray *parsedShoppingSettlementList = [NSMutableArray array];
    
    if ([receivedShoppingSettlementList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedShoppingSettlementList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedShoppingSettlementList addObject:[ShoppingSettlementList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedShoppingSettlementList isKindOfClass:[NSDictionary class]]) {
       [parsedShoppingSettlementList addObject:[ShoppingSettlementList modelObjectWithDictionary:(NSDictionary *)receivedShoppingSettlementList]];
    }

    self.list = [NSArray arrayWithArray:parsedShoppingSettlementList];
            self.msg = [self objectOrNilForKey:kShoppingSettlementBaseClassMsg fromDictionary:dict];
            self.cremain = [[self objectOrNilForKey:kShoppingSettlementBaseClassCremain fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amountTotal] forKey:kShoppingSettlementBaseClassAmountTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listAddressCount] forKey:kShoppingSettlementBaseClassListAddressCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kShoppingSettlementBaseClassAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kShoppingSettlementBaseClassCount];
    NSMutableArray *tempArrayForListAddress = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listAddress) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListAddress addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListAddress addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListAddress] forKey:kShoppingSettlementBaseClassListAddress];
    [mutableDict setValue:self.imgSrc forKey:kShoppingSettlementBaseClassImgSrc];
    [mutableDict setValue:self.settleType forKey:kShoppingSettlementBaseClassSettleType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.freight] forKey:kShoppingSettlementBaseClassFreight];
    [mutableDict setValue:[self.mapAddress dictionaryRepresentation] forKey:kShoppingSettlementBaseClassMapAddress];
    [mutableDict setValue:self.code forKey:kShoppingSettlementBaseClassCode];
    [mutableDict setValue:self.commBox forKey:kShoppingSettlementBaseClassCommBox];
    [mutableDict setValue:[NSNumber numberWithDouble:self.disamount] forKey:kShoppingSettlementBaseClassDisamount];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kShoppingSettlementBaseClassList];
    [mutableDict setValue:self.msg forKey:kShoppingSettlementBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cremain] forKey:kShoppingSettlementBaseClassCremain];

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

    self.amountTotal = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassAmountTotal];
    self.listAddressCount = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassListAddressCount];
    self.amount = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassAmount];
    self.count = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassCount];
    self.listAddress = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassListAddress];
    self.imgSrc = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassImgSrc];
    self.settleType = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassSettleType];
    self.freight = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassFreight];
    self.mapAddress = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassMapAddress];
    self.code = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassCode];
    self.commBox = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassCommBox];
    self.disamount = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassDisamount];
    self.list = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassList];
    self.msg = [aDecoder decodeObjectForKey:kShoppingSettlementBaseClassMsg];
    self.cremain = [aDecoder decodeDoubleForKey:kShoppingSettlementBaseClassCremain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amountTotal forKey:kShoppingSettlementBaseClassAmountTotal];
    [aCoder encodeDouble:_listAddressCount forKey:kShoppingSettlementBaseClassListAddressCount];
    [aCoder encodeDouble:_amount forKey:kShoppingSettlementBaseClassAmount];
    [aCoder encodeDouble:_count forKey:kShoppingSettlementBaseClassCount];
    [aCoder encodeObject:_listAddress forKey:kShoppingSettlementBaseClassListAddress];
    [aCoder encodeObject:_imgSrc forKey:kShoppingSettlementBaseClassImgSrc];
    [aCoder encodeObject:_settleType forKey:kShoppingSettlementBaseClassSettleType];
    [aCoder encodeDouble:_freight forKey:kShoppingSettlementBaseClassFreight];
    [aCoder encodeObject:_mapAddress forKey:kShoppingSettlementBaseClassMapAddress];
    [aCoder encodeObject:_code forKey:kShoppingSettlementBaseClassCode];
    [aCoder encodeObject:_commBox forKey:kShoppingSettlementBaseClassCommBox];
    [aCoder encodeDouble:_disamount forKey:kShoppingSettlementBaseClassDisamount];
    [aCoder encodeObject:_list forKey:kShoppingSettlementBaseClassList];
    [aCoder encodeObject:_msg forKey:kShoppingSettlementBaseClassMsg];
    [aCoder encodeDouble:_cremain forKey:kShoppingSettlementBaseClassCremain];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingSettlementBaseClass *copy = [[ShoppingSettlementBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.amountTotal = self.amountTotal;
        copy.listAddressCount = self.listAddressCount;
        copy.amount = self.amount;
        copy.count = self.count;
        copy.listAddress = [self.listAddress copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.settleType = [self.settleType copyWithZone:zone];
        copy.freight = self.freight;
        copy.mapAddress = [self.mapAddress copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.commBox = [self.commBox copyWithZone:zone];
        copy.disamount = self.disamount;
        copy.list = [self.list copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.cremain = self.cremain;
    }
    
    return copy;
}


@end
