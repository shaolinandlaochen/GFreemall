//
//  OrderListBaseClass.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderListBaseClass.h"
#import "OrderListPagingList.h"


NSString *const kOrderListBaseClassImgSrc = @"imgSrc";
NSString *const kOrderListBaseClassCode = @"code";
NSString *const kOrderListBaseClassNoReceiving = @"noReceiving";
NSString *const kOrderListBaseClassIsComment = @"isComment";
NSString *const kOrderListBaseClassNoPay = @"noPay";
NSString *const kOrderListBaseClassPagingList = @"pagingList";
NSString *const kOrderListBaseClassMsg = @"msg";


@interface OrderListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderListBaseClass

@synthesize imgSrc = _imgSrc;
@synthesize code = _code;
@synthesize noReceiving = _noReceiving;
@synthesize isComment = _isComment;
@synthesize noPay = _noPay;
@synthesize pagingList = _pagingList;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.imgSrc = [self objectOrNilForKey:kOrderListBaseClassImgSrc fromDictionary:dict];
            self.code = [self objectOrNilForKey:kOrderListBaseClassCode fromDictionary:dict];
            self.noReceiving = [[self objectOrNilForKey:kOrderListBaseClassNoReceiving fromDictionary:dict] doubleValue];
            self.isComment = [[self objectOrNilForKey:kOrderListBaseClassIsComment fromDictionary:dict] doubleValue];
            self.noPay = [[self objectOrNilForKey:kOrderListBaseClassNoPay fromDictionary:dict] doubleValue];
            self.pagingList = [OrderListPagingList modelObjectWithDictionary:[dict objectForKey:kOrderListBaseClassPagingList]];
            self.msg = [self objectOrNilForKey:kOrderListBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgSrc forKey:kOrderListBaseClassImgSrc];
    [mutableDict setValue:self.code forKey:kOrderListBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.noReceiving] forKey:kOrderListBaseClassNoReceiving];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isComment] forKey:kOrderListBaseClassIsComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.noPay] forKey:kOrderListBaseClassNoPay];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kOrderListBaseClassPagingList];
    [mutableDict setValue:self.msg forKey:kOrderListBaseClassMsg];

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

    self.imgSrc = [aDecoder decodeObjectForKey:kOrderListBaseClassImgSrc];
    self.code = [aDecoder decodeObjectForKey:kOrderListBaseClassCode];
    self.noReceiving = [aDecoder decodeDoubleForKey:kOrderListBaseClassNoReceiving];
    self.isComment = [aDecoder decodeDoubleForKey:kOrderListBaseClassIsComment];
    self.noPay = [aDecoder decodeDoubleForKey:kOrderListBaseClassNoPay];
    self.pagingList = [aDecoder decodeObjectForKey:kOrderListBaseClassPagingList];
    self.msg = [aDecoder decodeObjectForKey:kOrderListBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgSrc forKey:kOrderListBaseClassImgSrc];
    [aCoder encodeObject:_code forKey:kOrderListBaseClassCode];
    [aCoder encodeDouble:_noReceiving forKey:kOrderListBaseClassNoReceiving];
    [aCoder encodeDouble:_isComment forKey:kOrderListBaseClassIsComment];
    [aCoder encodeDouble:_noPay forKey:kOrderListBaseClassNoPay];
    [aCoder encodeObject:_pagingList forKey:kOrderListBaseClassPagingList];
    [aCoder encodeObject:_msg forKey:kOrderListBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderListBaseClass *copy = [[OrderListBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.noReceiving = self.noReceiving;
        copy.isComment = self.isComment;
        copy.noPay = self.noPay;
        copy.pagingList = [self.pagingList copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
