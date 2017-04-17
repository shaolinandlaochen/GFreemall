//
//  SearchBaseClass.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SearchBaseClass.h"
#import "SearchPagingList.h"


NSString *const kSearchBaseClassCode = @"code";
NSString *const kSearchBaseClassImgSrc = @"imgSrc";
NSString *const kSearchBaseClassMsg = @"msg";
NSString *const kSearchBaseClassPagingList = @"pagingList";


@interface SearchBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SearchBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize msg = _msg;
@synthesize pagingList = _pagingList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kSearchBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kSearchBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kSearchBaseClassMsg fromDictionary:dict];
            self.pagingList = [SearchPagingList modelObjectWithDictionary:[dict objectForKey:kSearchBaseClassPagingList]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kSearchBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kSearchBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kSearchBaseClassMsg];
    [mutableDict setValue:[self.pagingList dictionaryRepresentation] forKey:kSearchBaseClassPagingList];

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

    self.code = [aDecoder decodeObjectForKey:kSearchBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kSearchBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kSearchBaseClassMsg];
    self.pagingList = [aDecoder decodeObjectForKey:kSearchBaseClassPagingList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kSearchBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kSearchBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kSearchBaseClassMsg];
    [aCoder encodeObject:_pagingList forKey:kSearchBaseClassPagingList];
}

- (id)copyWithZone:(NSZone *)zone {
    SearchBaseClass *copy = [[SearchBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.pagingList = [self.pagingList copyWithZone:zone];
    }
    
    return copy;
}


@end
