//
//  ShoppingCarBaseClass.m
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ShoppingCarBaseClass.h"
#import "ShoppingCarList.h"


NSString *const kShoppingCarBaseClassCode = @"code";
NSString *const kShoppingCarBaseClassImgSrc = @"imgSrc";
NSString *const kShoppingCarBaseClassList = @"list";
NSString *const kShoppingCarBaseClassMsg = @"msg";


@interface ShoppingCarBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingCarBaseClass

@synthesize code = _code;
@synthesize imgSrc = _imgSrc;
@synthesize list = _list;
@synthesize msg = _msg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kShoppingCarBaseClassCode fromDictionary:dict];
            self.imgSrc = [self objectOrNilForKey:kShoppingCarBaseClassImgSrc fromDictionary:dict];
    NSObject *receivedShoppingCarList = [dict objectForKey:kShoppingCarBaseClassList];
    NSMutableArray *parsedShoppingCarList = [NSMutableArray array];
    
    if ([receivedShoppingCarList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedShoppingCarList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedShoppingCarList addObject:[ShoppingCarList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedShoppingCarList isKindOfClass:[NSDictionary class]]) {
       [parsedShoppingCarList addObject:[ShoppingCarList modelObjectWithDictionary:(NSDictionary *)receivedShoppingCarList]];
    }

    self.list = [NSArray arrayWithArray:parsedShoppingCarList];
            self.msg = [self objectOrNilForKey:kShoppingCarBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kShoppingCarBaseClassCode];
    [mutableDict setValue:self.imgSrc forKey:kShoppingCarBaseClassImgSrc];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kShoppingCarBaseClassList];
    [mutableDict setValue:self.msg forKey:kShoppingCarBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kShoppingCarBaseClassCode];
    self.imgSrc = [aDecoder decodeObjectForKey:kShoppingCarBaseClassImgSrc];
    self.list = [aDecoder decodeObjectForKey:kShoppingCarBaseClassList];
    self.msg = [aDecoder decodeObjectForKey:kShoppingCarBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kShoppingCarBaseClassCode];
    [aCoder encodeObject:_imgSrc forKey:kShoppingCarBaseClassImgSrc];
    [aCoder encodeObject:_list forKey:kShoppingCarBaseClassList];
    [aCoder encodeObject:_msg forKey:kShoppingCarBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    ShoppingCarBaseClass *copy = [[ShoppingCarBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
