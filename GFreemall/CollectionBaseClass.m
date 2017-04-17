//
//  CollectionBaseClass.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CollectionBaseClass.h"
#import "CollectionData.h"


NSString *const kCollectionBaseClassCode = @"code";
NSString *const kCollectionBaseClassData = @"data";
NSString *const kCollectionBaseClassImgSrc = @"imgSrc";
NSString *const kCollectionBaseClassMsg = @"msg";


@interface CollectionBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CollectionBaseClass

@synthesize code = _code;
@synthesize data = _data;
@synthesize imgSrc = _imgSrc;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kCollectionBaseClassCode fromDictionary:dict];
            self.data = [CollectionData modelObjectWithDictionary:[dict objectForKey:kCollectionBaseClassData]];
            self.imgSrc = [self objectOrNilForKey:kCollectionBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kCollectionBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kCollectionBaseClassCode];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCollectionBaseClassData];
    [mutableDict setValue:self.imgSrc forKey:kCollectionBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kCollectionBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kCollectionBaseClassCode];
    self.data = [aDecoder decodeObjectForKey:kCollectionBaseClassData];
    self.imgSrc = [aDecoder decodeObjectForKey:kCollectionBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kCollectionBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kCollectionBaseClassCode];
    [aCoder encodeObject:_data forKey:kCollectionBaseClassData];
    [aCoder encodeObject:_imgSrc forKey:kCollectionBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kCollectionBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    CollectionBaseClass *copy = [[CollectionBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
