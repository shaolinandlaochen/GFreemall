//
//  Top_UpBaseClass.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Top_UpBaseClass.h"
#import "Top_UpPagingList.h"


NSString *const kTop_UpBaseClassCode = @"code";
NSString *const kTop_UpBaseClassEnd = @"end";
NSString *const kTop_UpBaseClassMsg = @"msg";
NSString *const kTop_UpBaseClassPagingList = @"pagingList";
NSString *const kTop_UpBaseClassStart = @"start";


@interface Top_UpBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top_UpBaseClass

@synthesize code = _code;
@synthesize endProperty = _endProperty;
@synthesize msg = _msg;
@synthesize pagingList = _pagingList;
@synthesize start = _start;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kTop_UpBaseClassCode fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kTop_UpBaseClassEnd fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kTop_UpBaseClassMsg fromDictionary:dict];
            self.pagingList = [Top_UpPagingList modelObjectWithDictionary:[dict objectForKey:kTop_UpBaseClassPagingList]];
            self.start = [self objectOrNilForKey:kTop_UpBaseClassStart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kTop_UpBaseClassCode];
    [mutableDict setValue:self.endProperty forKey:kTop_UpBaseClassEnd];
    [mutableDict setValue:self.msg forKey:kTop_UpBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kTop_UpBaseClassPagingList];
    [mutableDict setValue:self.start forKey:kTop_UpBaseClassStart];

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

    self.code = [aDecoder decodeObjectForKey:kTop_UpBaseClassCode];
    self.endProperty = [aDecoder decodeObjectForKey:kTop_UpBaseClassEnd];
    self.msg = [aDecoder decodeObjectForKey:kTop_UpBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kTop_UpBaseClassPagingList];
    self.start = [aDecoder decodeObjectForKey:kTop_UpBaseClassStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kTop_UpBaseClassCode];
    [aCoder encodeObject:_endProperty forKey:kTop_UpBaseClassEnd];
    [aCoder encodeObject:_msg forKey:kTop_UpBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kTop_UpBaseClassPagingList];
    [aCoder encodeObject:_start forKey:kTop_UpBaseClassStart];
}

- (id)copyWithZone:(NSZone *)zone {
    Top_UpBaseClass *copy = [[Top_UpBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
    }
    
    return copy;
}


@end
