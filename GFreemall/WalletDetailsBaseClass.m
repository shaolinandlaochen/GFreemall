//
//  WalletDetailsBaseClass.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "WalletDetailsBaseClass.h"
#import "WalletDetailsPagingList.h"


NSString *const kWalletDetailsBaseClassCode = @"code";
NSString *const kWalletDetailsBaseClassEnd = @"end";
NSString *const kWalletDetailsBaseClassMsg = @"msg";
NSString *const kWalletDetailsBaseClassPagingList = @"pagingList";
NSString *const kWalletDetailsBaseClassStart = @"start";


@interface WalletDetailsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WalletDetailsBaseClass

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
            self.code = [self objectOrNilForKey:kWalletDetailsBaseClassCode fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kWalletDetailsBaseClassEnd fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kWalletDetailsBaseClassMsg fromDictionary:dict];
            self.pagingList = [WalletDetailsPagingList modelObjectWithDictionary:[dict objectForKey:kWalletDetailsBaseClassPagingList]];
            self.start = [self objectOrNilForKey:kWalletDetailsBaseClassStart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kWalletDetailsBaseClassCode];
    [mutableDict setValue:self.endProperty forKey:kWalletDetailsBaseClassEnd];
    [mutableDict setValue:self.msg forKey:kWalletDetailsBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kWalletDetailsBaseClassPagingList];
    [mutableDict setValue:self.start forKey:kWalletDetailsBaseClassStart];

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

    self.code = [aDecoder decodeObjectForKey:kWalletDetailsBaseClassCode];
    self.endProperty = [aDecoder decodeObjectForKey:kWalletDetailsBaseClassEnd];
    self.msg = [aDecoder decodeObjectForKey:kWalletDetailsBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kWalletDetailsBaseClassPagingList];
    self.start = [aDecoder decodeObjectForKey:kWalletDetailsBaseClassStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kWalletDetailsBaseClassCode];
    [aCoder encodeObject:_endProperty forKey:kWalletDetailsBaseClassEnd];
    [aCoder encodeObject:_msg forKey:kWalletDetailsBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kWalletDetailsBaseClassPagingList];
    [aCoder encodeObject:_start forKey:kWalletDetailsBaseClassStart];
}

- (id)copyWithZone:(NSZone *)zone {
    WalletDetailsBaseClass *copy = [[WalletDetailsBaseClass alloc] init];
    
    
    
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
