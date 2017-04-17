//
//  MessageBaseClass.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MessageBaseClass.h"
#import "MessageData.h"


NSString *const kMessageBaseClassMsg = @"msg";
NSString *const kMessageBaseClassData = @"data";
NSString *const kMessageBaseClassCode = @"code";


@interface MessageBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MessageBaseClass

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
            self.msg = [self objectOrNilForKey:kMessageBaseClassMsg fromDictionary:dict];
            self.data = [MessageData modelObjectWithDictionary:[dict objectForKey:kMessageBaseClassData]];
            self.code = [self objectOrNilForKey:kMessageBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMessageBaseClassMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMessageBaseClassData];
    [mutableDict setValue:self.code forKey:kMessageBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMessageBaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kMessageBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kMessageBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMessageBaseClassMsg];
    [aCoder encodeObject:_data forKey:kMessageBaseClassData];
    [aCoder encodeObject:_code forKey:kMessageBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    MessageBaseClass *copy = [[MessageBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
