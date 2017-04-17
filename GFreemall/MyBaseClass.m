//
//  MyBaseClass.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyBaseClass.h"
#import "MyInfo.h"


NSString *const kMyBaseClassCode = @"code";
NSString *const kMyBaseClassImgSrc = @"imgSrc";
NSString *const kMyBaseClassInfo = @"info";
NSString *const kMyBaseClassMsg = @"msg";


@interface MyBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize info = _info;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kMyBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kMyBaseClassImgSrc fromDictionary:dict];
            self.info = [MyInfo modelObjectWithDictionary:[dict objectForKey:kMyBaseClassInfo]];
            self.msg = [self objectOrNilForKey:kMyBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kMyBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kMyBaseClassImgSrc];
    [mutableDict setValue:[self.info dictionaryRepresentation] forKey:kMyBaseClassInfo];
    [mutableDict setValue:self.msg forKey:kMyBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kMyBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kMyBaseClassImgSrc];
    self.info = [aDecoder decodeObjectForKey:kMyBaseClassInfo];
    self.msg = [aDecoder decodeObjectForKey:kMyBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kMyBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kMyBaseClassImgSrc];
    [aCoder encodeObject:_info forKey:kMyBaseClassInfo];
    [aCoder encodeObject:_msg forKey:kMyBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    MyBaseClass *copy = [[MyBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.info = [self.info copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
