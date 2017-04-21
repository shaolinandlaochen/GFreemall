//
//  GoodsDetailsListAttribute.m
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsListAttribute.h"


NSString *const kGoodsDetailsListAttributeEAttributeVal = @"e_attribute_val";
NSString *const kGoodsDetailsListAttributeAttributeName = @"attribute_name";
NSString *const kGoodsDetailsListAttributeAttributeNameEn = @"attribute_name_en";


@interface GoodsDetailsListAttribute ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsListAttribute

@synthesize eAttributeVal = _eAttributeVal;
@synthesize attributeName = _attributeName;
@synthesize attributeNameEn = _attributeNameEn;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.eAttributeVal = [self objectOrNilForKey:kGoodsDetailsListAttributeEAttributeVal fromDictionary:dict];
            self.attributeName = [self objectOrNilForKey:kGoodsDetailsListAttributeAttributeName fromDictionary:dict];
            self.attributeNameEn = [self objectOrNilForKey:kGoodsDetailsListAttributeAttributeNameEn fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForEAttributeVal = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.eAttributeVal) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEAttributeVal addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEAttributeVal addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEAttributeVal] forKey:kGoodsDetailsListAttributeEAttributeVal];
    [mutableDict setValue:self.attributeName forKey:kGoodsDetailsListAttributeAttributeName];
    [mutableDict setValue:self.attributeNameEn forKey:kGoodsDetailsListAttributeAttributeNameEn];

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

    self.eAttributeVal = [aDecoder decodeObjectForKey:kGoodsDetailsListAttributeEAttributeVal];
    self.attributeName = [aDecoder decodeObjectForKey:kGoodsDetailsListAttributeAttributeName];
    self.attributeNameEn = [aDecoder decodeObjectForKey:kGoodsDetailsListAttributeAttributeNameEn];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_eAttributeVal forKey:kGoodsDetailsListAttributeEAttributeVal];
    [aCoder encodeObject:_attributeName forKey:kGoodsDetailsListAttributeAttributeName];
    [aCoder encodeObject:_attributeNameEn forKey:kGoodsDetailsListAttributeAttributeNameEn];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetailsListAttribute *copy = [[GoodsDetailsListAttribute alloc] init];
    
    
    
    if (copy) {

        copy.eAttributeVal = [self.eAttributeVal copyWithZone:zone];
        copy.attributeName = [self.attributeName copyWithZone:zone];
        copy.attributeNameEn = [self.attributeNameEn copyWithZone:zone];
    }
    
    return copy;
}


@end
