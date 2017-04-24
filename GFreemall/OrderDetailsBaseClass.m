//
//  OrderDetailsBaseClass.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderDetailsBaseClass.h"
#import "OrderDetailsMap.h"


NSString *const kOrderDetailsBaseClassCode = @"code";
NSString *const kOrderDetailsBaseClassImgSrc = @"imgSrc";
NSString *const kOrderDetailsBaseClassMap = @"map";
NSString *const kOrderDetailsBaseClassMsg = @"msg";


@interface OrderDetailsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderDetailsBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize map = _map;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kOrderDetailsBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kOrderDetailsBaseClassImgSrc fromDictionary:dict];
            self.map = [OrderDetailsMap modelObjectWithDictionary:[dict objectForKey:kOrderDetailsBaseClassMap]];
            self.msg = [self objectOrNilForKey:kOrderDetailsBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kOrderDetailsBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kOrderDetailsBaseClassImgSrc];
    [mutableDict setValue:[self.map dictionaryRepresentation] forKey:kOrderDetailsBaseClassMap];
    [mutableDict setValue:self.msg forKey:kOrderDetailsBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kOrderDetailsBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kOrderDetailsBaseClassImgSrc];
    self.map = [aDecoder decodeObjectForKey:kOrderDetailsBaseClassMap];
    self.msg = [aDecoder decodeObjectForKey:kOrderDetailsBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kOrderDetailsBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kOrderDetailsBaseClassImgSrc];
    [aCoder encodeObject:_map forKey:kOrderDetailsBaseClassMap];
    [aCoder encodeObject:_msg forKey:kOrderDetailsBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderDetailsBaseClass *copy = [[OrderDetailsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.map = [self.map copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
