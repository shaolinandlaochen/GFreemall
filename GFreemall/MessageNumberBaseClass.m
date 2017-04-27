//
//  MessageNumberBaseClass.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MessageNumberBaseClass.h"


NSString *const kMessageNumberBaseClassMsg = @"msg";
NSString *const kMessageNumberBaseClassData = @"data";
NSString *const kMessageNumberBaseClassCode = @"code";


@interface MessageNumberBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MessageNumberBaseClass

@synthesize msg = _msg;
@synthesize data = _data;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kMessageNumberBaseClassMsg fromDictionary:dict];
            self.data = [[self objectOrNilForKey:kMessageNumberBaseClassData fromDictionary:dict] doubleValue];
            self.code = [self objectOrNilForKey:kMessageNumberBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMessageNumberBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.data] forKey:kMessageNumberBaseClassData];
    [mutableDict setValue:self.code forKey:kMessageNumberBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMessageNumberBaseClassMsg];
    self.data = [aDecoder decodeDoubleForKey:kMessageNumberBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kMessageNumberBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMessageNumberBaseClassMsg];
    [aCoder encodeDouble:_data forKey:kMessageNumberBaseClassData];
    [aCoder encodeObject:_code forKey:kMessageNumberBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    MessageNumberBaseClass *copy = [[MessageNumberBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = self.data;
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
