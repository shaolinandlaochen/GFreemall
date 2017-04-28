//
//  ChildProductDetailsBaseClass.m
//
//  Created by   on 2017/4/28
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ChildProductDetailsBaseClass.h"
#import "ChildProductDetailsMap.h"


NSString *const kChildProductDetailsBaseClassMap = @"map";
NSString *const kChildProductDetailsBaseClassMsg = @"msg";
NSString *const kChildProductDetailsBaseClassCode = @"code";


@interface ChildProductDetailsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ChildProductDetailsBaseClass

@synthesize map = _map;
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
            self.map = [ChildProductDetailsMap modelObjectWithDictionary:[dict objectForKey:kChildProductDetailsBaseClassMap]];
            self.msg = [self objectOrNilForKey:kChildProductDetailsBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kChildProductDetailsBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.map dictionaryRepresentation] forKey:kChildProductDetailsBaseClassMap];
    [mutableDict setValue:self.msg forKey:kChildProductDetailsBaseClassMsg];
    [mutableDict setValue:self.code forKey:kChildProductDetailsBaseClassCode];

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

    self.map = [aDecoder decodeObjectForKey:kChildProductDetailsBaseClassMap];
    self.msg = [aDecoder decodeObjectForKey:kChildProductDetailsBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kChildProductDetailsBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_map forKey:kChildProductDetailsBaseClassMap];
    [aCoder encodeObject:_msg forKey:kChildProductDetailsBaseClassMsg];
    [aCoder encodeObject:_code forKey:kChildProductDetailsBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    ChildProductDetailsBaseClass *copy = [[ChildProductDetailsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.map = [self.map copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
