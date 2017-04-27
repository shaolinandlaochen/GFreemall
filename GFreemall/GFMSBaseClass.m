//
//  GFMSBaseClass.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GFMSBaseClass.h"
#import "GFMSOrderMap.h"


NSString *const kGFMSBaseClassMsg = @"msg";
NSString *const kGFMSBaseClassOrderMap = @"orderMap";
NSString *const kGFMSBaseClassCode = @"code";


@interface GFMSBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GFMSBaseClass

@synthesize msg = _msg;
@synthesize orderMap = _orderMap;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kGFMSBaseClassMsg fromDictionary:dict];
            self.orderMap = [GFMSOrderMap modelObjectWithDictionary:[dict objectForKey:kGFMSBaseClassOrderMap]];
            self.code = [self objectOrNilForKey:kGFMSBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kGFMSBaseClassMsg];
    [mutableDict setValue:[self.orderMap dictionaryRepresentation] forKey:kGFMSBaseClassOrderMap];
    [mutableDict setValue:self.code forKey:kGFMSBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kGFMSBaseClassMsg];
    self.orderMap = [aDecoder decodeObjectForKey:kGFMSBaseClassOrderMap];
    self.code = [aDecoder decodeObjectForKey:kGFMSBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kGFMSBaseClassMsg];
    [aCoder encodeObject:_orderMap forKey:kGFMSBaseClassOrderMap];
    [aCoder encodeObject:_code forKey:kGFMSBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    GFMSBaseClass *copy = [[GFMSBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.orderMap = [self.orderMap copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
