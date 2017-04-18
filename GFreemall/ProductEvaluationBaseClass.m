//
//  ProductEvaluationBaseClass.m
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ProductEvaluationBaseClass.h"
#import "ProductEvaluationListComment.h"


NSString *const kProductEvaluationBaseClassImgSrc = @"imgSrc";
NSString *const kProductEvaluationBaseClassGoodCount = @"goodCount";
NSString *const kProductEvaluationBaseClassTotalCount = @"totalCount";
NSString *const kProductEvaluationBaseClassListComment = @"listComment";
NSString *const kProductEvaluationBaseClassCode = @"code";
NSString *const kProductEvaluationBaseClassMsg = @"msg";
NSString *const kProductEvaluationBaseClassBadCount = @"badCount";
NSString *const kProductEvaluationBaseClassCommonlyCount = @"commonlyCount";


@interface ProductEvaluationBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductEvaluationBaseClass

@synthesize imgSrc = _imgSrc;
@synthesize goodCount = _goodCount;
@synthesize totalCount = _totalCount;
@synthesize listComment = _listComment;
@synthesize code = _code;
@synthesize msg = _msg;
@synthesize badCount = _badCount;
@synthesize commonlyCount = _commonlyCount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.imgSrc = [self objectOrNilForKey:kProductEvaluationBaseClassImgSrc fromDictionary:dict];
            self.goodCount = [[self objectOrNilForKey:kProductEvaluationBaseClassGoodCount fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kProductEvaluationBaseClassTotalCount fromDictionary:dict] doubleValue];
            self.listComment = [ProductEvaluationListComment modelObjectWithDictionary:[dict objectForKey:kProductEvaluationBaseClassListComment]];
            self.code = [self objectOrNilForKey:kProductEvaluationBaseClassCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kProductEvaluationBaseClassMsg fromDictionary:dict];
            self.badCount = [[self objectOrNilForKey:kProductEvaluationBaseClassBadCount fromDictionary:dict] doubleValue];
            self.commonlyCount = [[self objectOrNilForKey:kProductEvaluationBaseClassCommonlyCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgSrc forKey:kProductEvaluationBaseClassImgSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodCount] forKey:kProductEvaluationBaseClassGoodCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kProductEvaluationBaseClassTotalCount];
    [mutableDict setValue:[self.listComment dictionaryRepresentation] forKey:kProductEvaluationBaseClassListComment];
    [mutableDict setValue:self.code forKey:kProductEvaluationBaseClassCode];
    [mutableDict setValue:self.msg forKey:kProductEvaluationBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.badCount] forKey:kProductEvaluationBaseClassBadCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commonlyCount] forKey:kProductEvaluationBaseClassCommonlyCount];

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

    self.imgSrc = [aDecoder decodeObjectForKey:kProductEvaluationBaseClassImgSrc];
    self.goodCount = [aDecoder decodeDoubleForKey:kProductEvaluationBaseClassGoodCount];
    self.totalCount = [aDecoder decodeDoubleForKey:kProductEvaluationBaseClassTotalCount];
    self.listComment = [aDecoder decodeObjectForKey:kProductEvaluationBaseClassListComment];
    self.code = [aDecoder decodeObjectForKey:kProductEvaluationBaseClassCode];
    self.msg = [aDecoder decodeObjectForKey:kProductEvaluationBaseClassMsg];
    self.badCount = [aDecoder decodeDoubleForKey:kProductEvaluationBaseClassBadCount];
    self.commonlyCount = [aDecoder decodeDoubleForKey:kProductEvaluationBaseClassCommonlyCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgSrc forKey:kProductEvaluationBaseClassImgSrc];
    [aCoder encodeDouble:_goodCount forKey:kProductEvaluationBaseClassGoodCount];
    [aCoder encodeDouble:_totalCount forKey:kProductEvaluationBaseClassTotalCount];
    [aCoder encodeObject:_listComment forKey:kProductEvaluationBaseClassListComment];
    [aCoder encodeObject:_code forKey:kProductEvaluationBaseClassCode];
    [aCoder encodeObject:_msg forKey:kProductEvaluationBaseClassMsg];
    [aCoder encodeDouble:_badCount forKey:kProductEvaluationBaseClassBadCount];
    [aCoder encodeDouble:_commonlyCount forKey:kProductEvaluationBaseClassCommonlyCount];
}

- (id)copyWithZone:(NSZone *)zone {
    ProductEvaluationBaseClass *copy = [[ProductEvaluationBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.goodCount = self.goodCount;
        copy.totalCount = self.totalCount;
        copy.listComment = [self.listComment copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.badCount = self.badCount;
        copy.commonlyCount = self.commonlyCount;
    }
    
    return copy;
}


@end
