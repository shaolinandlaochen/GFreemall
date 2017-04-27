//
//  GFMSOrderMap.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GFMSOrderMap.h"


NSString *const kGFMSOrderMapGfmAmount = @"gfmAmount";
NSString *const kGFMSOrderMapOrderPayment = @"order_payment";
NSString *const kGFMSOrderMapOrderPayAmount = @"order_pay_amount";
NSString *const kGFMSOrderMapCurrGfmPrice = @"currGfmPrice";


@interface GFMSOrderMap ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GFMSOrderMap

@synthesize gfmAmount = _gfmAmount;
@synthesize orderPayment = _orderPayment;
@synthesize orderPayAmount = _orderPayAmount;
@synthesize currGfmPrice = _currGfmPrice;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.gfmAmount = [[self objectOrNilForKey:kGFMSOrderMapGfmAmount fromDictionary:dict] doubleValue];
            self.orderPayment = [[self objectOrNilForKey:kGFMSOrderMapOrderPayment fromDictionary:dict] doubleValue];
            self.orderPayAmount = [[self objectOrNilForKey:kGFMSOrderMapOrderPayAmount fromDictionary:dict] doubleValue];
            self.currGfmPrice = [[self objectOrNilForKey:kGFMSOrderMapCurrGfmPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gfmAmount] forKey:kGFMSOrderMapGfmAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayment] forKey:kGFMSOrderMapOrderPayment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayAmount] forKey:kGFMSOrderMapOrderPayAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currGfmPrice] forKey:kGFMSOrderMapCurrGfmPrice];

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

    self.gfmAmount = [aDecoder decodeDoubleForKey:kGFMSOrderMapGfmAmount];
    self.orderPayment = [aDecoder decodeDoubleForKey:kGFMSOrderMapOrderPayment];
    self.orderPayAmount = [aDecoder decodeDoubleForKey:kGFMSOrderMapOrderPayAmount];
    self.currGfmPrice = [aDecoder decodeDoubleForKey:kGFMSOrderMapCurrGfmPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_gfmAmount forKey:kGFMSOrderMapGfmAmount];
    [aCoder encodeDouble:_orderPayment forKey:kGFMSOrderMapOrderPayment];
    [aCoder encodeDouble:_orderPayAmount forKey:kGFMSOrderMapOrderPayAmount];
    [aCoder encodeDouble:_currGfmPrice forKey:kGFMSOrderMapCurrGfmPrice];
}

- (id)copyWithZone:(NSZone *)zone {
    GFMSOrderMap *copy = [[GFMSOrderMap alloc] init];
    
    
    
    if (copy) {

        copy.gfmAmount = self.gfmAmount;
        copy.orderPayment = self.orderPayment;
        copy.orderPayAmount = self.orderPayAmount;
        copy.currGfmPrice = self.currGfmPrice;
    }
    
    return copy;
}


@end
