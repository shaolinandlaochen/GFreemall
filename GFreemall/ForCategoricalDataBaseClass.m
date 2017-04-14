//
//  ForCategoricalDataBaseClass.m
//
//  Created by   on 2017/4/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForCategoricalDataBaseClass.h"
#import "ForCategoricalDataListCategory.h"


NSString *const kForCategoricalDataBaseClassCode = @"code";
NSString *const kForCategoricalDataBaseClassListCategory = @"listCategory";
NSString *const kForCategoricalDataBaseClassImgSrc = @"imgSrc";
NSString *const kForCategoricalDataBaseClassMsg = @"msg";


@interface ForCategoricalDataBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForCategoricalDataBaseClass

@synthesize code = _code;
@synthesize listCategory = _listCategory;
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
            self.code = [self objectOrNilForKey:kForCategoricalDataBaseClassCode fromDictionary:dict];
    NSObject *receivedForCategoricalDataListCategory = [dict objectForKey:kForCategoricalDataBaseClassListCategory];
    NSMutableArray *parsedForCategoricalDataListCategory = [NSMutableArray array];
    
    if ([receivedForCategoricalDataListCategory isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForCategoricalDataListCategory) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForCategoricalDataListCategory addObject:[ForCategoricalDataListCategory modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForCategoricalDataListCategory isKindOfClass:[NSDictionary class]]) {
       [parsedForCategoricalDataListCategory addObject:[ForCategoricalDataListCategory modelObjectWithDictionary:(NSDictionary *)receivedForCategoricalDataListCategory]];
    }

    self.listCategory = [NSArray arrayWithArray:parsedForCategoricalDataListCategory];
            self.imgSrc = [self objectOrNilForKey:kForCategoricalDataBaseClassImgSrc fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kForCategoricalDataBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kForCategoricalDataBaseClassCode];
    NSMutableArray *tempArrayForListCategory = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listCategory) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListCategory addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListCategory addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListCategory] forKey:kForCategoricalDataBaseClassListCategory];
    [mutableDict setValue:self.imgSrc forKey:kForCategoricalDataBaseClassImgSrc];
    [mutableDict setValue:self.msg forKey:kForCategoricalDataBaseClassMsg];

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

    self.code = [aDecoder decodeObjectForKey:kForCategoricalDataBaseClassCode];
    self.listCategory = [aDecoder decodeObjectForKey:kForCategoricalDataBaseClassListCategory];
    self.imgSrc = [aDecoder decodeObjectForKey:kForCategoricalDataBaseClassImgSrc];
    self.msg = [aDecoder decodeObjectForKey:kForCategoricalDataBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kForCategoricalDataBaseClassCode];
    [aCoder encodeObject:_listCategory forKey:kForCategoricalDataBaseClassListCategory];
    [aCoder encodeObject:_imgSrc forKey:kForCategoricalDataBaseClassImgSrc];
    [aCoder encodeObject:_msg forKey:kForCategoricalDataBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone {
    ForCategoricalDataBaseClass *copy = [[ForCategoricalDataBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.listCategory = [self.listCategory copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
