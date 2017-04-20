//
//  ShoppingSettlementList.m
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingSettlementList.h"
#import "ShoppingSettlementCarts.h"
#import "ShoppingSettlementAttr.h"


NSString *const kShoppingSettlementListCarts = @"carts";
NSString *const kShoppingSettlementListAttr = @"attr";
NSString *const kShoppingSettlementListAttributes = @"attributes";


@interface ShoppingSettlementList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingSettlementList

@synthesize carts = _carts;
@synthesize attr = _attr;
@synthesize attributes = _attributes;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.carts = [ShoppingSettlementCarts modelObjectWithDictionary:[dict objectForKey:kShoppingSettlementListCarts]];
            self.attr = [ShoppingSettlementAttr modelObjectWithDictionary:[dict objectForKey:kShoppingSettlementListAttr]];
            self.attributes = [self objectOrNilForKey:kShoppingSettlementListAttributes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.carts dictionaryRepresentation] forKey:kShoppingSettlementListCarts];
    [mutableDict setValue:[self.attr dictionaryRepresentation] forKey:kShoppingSettlementListAttr];
    [mutableDict setValue:self.attributes forKey:kShoppingSettlementListAttributes];

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

    self.carts = [aDecoder decodeObjectForKey:kShoppingSettlementListCarts];
    self.attr = [aDecoder decodeObjectForKey:kShoppingSettlementListAttr];
    self.attributes = [aDecoder decodeObjectForKey:kShoppingSettlementListAttributes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_carts forKey:kShoppingSettlementListCarts];
    [aCoder encodeObject:_attr forKey:kShoppingSettlementListAttr];
    [aCoder encodeObject:_attributes forKey:kShoppingSettlementListAttributes];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingSettlementList *copy = [[ShoppingSettlementList alloc] init];
    
    
    
    if (copy) {

        copy.carts = [self.carts copyWithZone:zone];
        copy.attr = [self.attr copyWithZone:zone];
        copy.attributes = [self.attributes copyWithZone:zone];
    }
    
    return copy;
}


@end
