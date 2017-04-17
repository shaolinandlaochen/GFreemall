//
//  GoodsDetailsBaseClass.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsBaseClass.h"
#import "GoodsDetailsComm.h"
#import "GoodsDetailsMap.h"
#import "GoodsDetailsListComment.h"


NSString *const kGoodsDetailsBaseClassComm = @"comm";
NSString *const kGoodsDetailsBaseClassTotalCount = @"totalCount";
NSString *const kGoodsDetailsBaseClassListPic = @"listPic";
NSString *const kGoodsDetailsBaseClassMap = @"map";
NSString *const kGoodsDetailsBaseClassSerial = @"serial";
NSString *const kGoodsDetailsBaseClassCommonlyCount = @"commonlyCount";
NSString *const kGoodsDetailsBaseClassImgSrc = @"imgSrc";
NSString *const kGoodsDetailsBaseClassListAttribute = @"listAttribute";
NSString *const kGoodsDetailsBaseClassCode = @"code";
NSString *const kGoodsDetailsBaseClassCheckRes = @"checkRes";
NSString *const kGoodsDetailsBaseClassSize = @"size";
NSString *const kGoodsDetailsBaseClassIsCollect = @"isCollect";
NSString *const kGoodsDetailsBaseClassBadCount = @"badCount";
NSString *const kGoodsDetailsBaseClassGoodCount = @"goodCount";
NSString *const kGoodsDetailsBaseClassMsg = @"msg";
NSString *const kGoodsDetailsBaseClassListComment = @"listComment";


@interface GoodsDetailsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsBaseClass

@synthesize comm = _comm;
@synthesize totalCount = _totalCount;
@synthesize listPic = _listPic;
@synthesize map = _map;
@synthesize serial = _serial;
@synthesize commonlyCount = _commonlyCount;
@synthesize imgSrc = _imgSrc;
@synthesize listAttribute = _listAttribute;
@synthesize code = _code;
@synthesize checkRes = _checkRes;
@synthesize size = _size;
@synthesize isCollect = _isCollect;
@synthesize badCount = _badCount;
@synthesize goodCount = _goodCount;
@synthesize msg = _msg;
@synthesize listComment = _listComment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.comm = [GoodsDetailsComm modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsBaseClassComm]];
            self.totalCount = [[self objectOrNilForKey:kGoodsDetailsBaseClassTotalCount fromDictionary:dict] doubleValue];
            self.listPic = [self objectOrNilForKey:kGoodsDetailsBaseClassListPic fromDictionary:dict];
            self.map = [GoodsDetailsMap modelObjectWithDictionary:[dict objectForKey:kGoodsDetailsBaseClassMap]];
            self.serial = [[self objectOrNilForKey:kGoodsDetailsBaseClassSerial fromDictionary:dict] doubleValue];
            self.commonlyCount = [[self objectOrNilForKey:kGoodsDetailsBaseClassCommonlyCount fromDictionary:dict] doubleValue];
            self.imgSrc = [self objectOrNilForKey:kGoodsDetailsBaseClassImgSrc fromDictionary:dict];
            self.listAttribute = [self objectOrNilForKey:kGoodsDetailsBaseClassListAttribute fromDictionary:dict];
            self.code = [self objectOrNilForKey:kGoodsDetailsBaseClassCode fromDictionary:dict];
            self.checkRes = [self objectOrNilForKey:kGoodsDetailsBaseClassCheckRes fromDictionary:dict];
            self.size = [[self objectOrNilForKey:kGoodsDetailsBaseClassSize fromDictionary:dict] doubleValue];
            self.isCollect = [[self objectOrNilForKey:kGoodsDetailsBaseClassIsCollect fromDictionary:dict] boolValue];
            self.badCount = [[self objectOrNilForKey:kGoodsDetailsBaseClassBadCount fromDictionary:dict] doubleValue];
            self.goodCount = [[self objectOrNilForKey:kGoodsDetailsBaseClassGoodCount fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kGoodsDetailsBaseClassMsg fromDictionary:dict];
    NSObject *receivedGoodsDetailsListComment = [dict objectForKey:kGoodsDetailsBaseClassListComment];
    NSMutableArray *parsedGoodsDetailsListComment = [NSMutableArray array];
    
    if ([receivedGoodsDetailsListComment isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGoodsDetailsListComment) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGoodsDetailsListComment addObject:[GoodsDetailsListComment modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGoodsDetailsListComment isKindOfClass:[NSDictionary class]]) {
       [parsedGoodsDetailsListComment addObject:[GoodsDetailsListComment modelObjectWithDictionary:(NSDictionary *)receivedGoodsDetailsListComment]];
    }

    self.listComment = [NSArray arrayWithArray:parsedGoodsDetailsListComment];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.comm dictionaryRepresentation] forKey:kGoodsDetailsBaseClassComm];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kGoodsDetailsBaseClassTotalCount];
    NSMutableArray *tempArrayForListPic = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listPic) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListPic addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListPic addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListPic] forKey:kGoodsDetailsBaseClassListPic];
    [mutableDict setValue:[self.map dictionaryRepresentation] forKey:kGoodsDetailsBaseClassMap];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serial] forKey:kGoodsDetailsBaseClassSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commonlyCount] forKey:kGoodsDetailsBaseClassCommonlyCount];
    [mutableDict setValue:self.imgSrc forKey:kGoodsDetailsBaseClassImgSrc];
    NSMutableArray *tempArrayForListAttribute = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listAttribute) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListAttribute addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListAttribute addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListAttribute] forKey:kGoodsDetailsBaseClassListAttribute];
    [mutableDict setValue:self.code forKey:kGoodsDetailsBaseClassCode];
    [mutableDict setValue:self.checkRes forKey:kGoodsDetailsBaseClassCheckRes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kGoodsDetailsBaseClassSize];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCollect] forKey:kGoodsDetailsBaseClassIsCollect];
    [mutableDict setValue:[NSNumber numberWithDouble:self.badCount] forKey:kGoodsDetailsBaseClassBadCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodCount] forKey:kGoodsDetailsBaseClassGoodCount];
    [mutableDict setValue:self.msg forKey:kGoodsDetailsBaseClassMsg];
    NSMutableArray *tempArrayForListComment = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.listComment) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListComment addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListComment addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListComment] forKey:kGoodsDetailsBaseClassListComment];

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

    self.comm = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassComm];
    self.totalCount = [aDecoder decodeDoubleForKey:kGoodsDetailsBaseClassTotalCount];
    self.listPic = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassListPic];
    self.map = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassMap];
    self.serial = [aDecoder decodeDoubleForKey:kGoodsDetailsBaseClassSerial];
    self.commonlyCount = [aDecoder decodeDoubleForKey:kGoodsDetailsBaseClassCommonlyCount];
    self.imgSrc = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassImgSrc];
    self.listAttribute = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassListAttribute];
    self.code = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassCode];
    self.checkRes = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassCheckRes];
    self.size = [aDecoder decodeDoubleForKey:kGoodsDetailsBaseClassSize];
    self.isCollect = [aDecoder decodeBoolForKey:kGoodsDetailsBaseClassIsCollect];
    self.badCount = [aDecoder decodeDoubleForKey:kGoodsDetailsBaseClassBadCount];
    self.goodCount = [aDecoder decodeDoubleForKey:kGoodsDetailsBaseClassGoodCount];
    self.msg = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassMsg];
    self.listComment = [aDecoder decodeObjectForKey:kGoodsDetailsBaseClassListComment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comm forKey:kGoodsDetailsBaseClassComm];
    [aCoder encodeDouble:_totalCount forKey:kGoodsDetailsBaseClassTotalCount];
    [aCoder encodeObject:_listPic forKey:kGoodsDetailsBaseClassListPic];
    [aCoder encodeObject:_map forKey:kGoodsDetailsBaseClassMap];
    [aCoder encodeDouble:_serial forKey:kGoodsDetailsBaseClassSerial];
    [aCoder encodeDouble:_commonlyCount forKey:kGoodsDetailsBaseClassCommonlyCount];
    [aCoder encodeObject:_imgSrc forKey:kGoodsDetailsBaseClassImgSrc];
    [aCoder encodeObject:_listAttribute forKey:kGoodsDetailsBaseClassListAttribute];
    [aCoder encodeObject:_code forKey:kGoodsDetailsBaseClassCode];
    [aCoder encodeObject:_checkRes forKey:kGoodsDetailsBaseClassCheckRes];
    [aCoder encodeDouble:_size forKey:kGoodsDetailsBaseClassSize];
    [aCoder encodeBool:_isCollect forKey:kGoodsDetailsBaseClassIsCollect];
    [aCoder encodeDouble:_badCount forKey:kGoodsDetailsBaseClassBadCount];
    [aCoder encodeDouble:_goodCount forKey:kGoodsDetailsBaseClassGoodCount];
    [aCoder encodeObject:_msg forKey:kGoodsDetailsBaseClassMsg];
    [aCoder encodeObject:_listComment forKey:kGoodsDetailsBaseClassListComment];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetailsBaseClass *copy = [[GoodsDetailsBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.comm = [self.comm copyWithZone:zone];
        copy.totalCount = self.totalCount;
        copy.listPic = [self.listPic copyWithZone:zone];
        copy.map = [self.map copyWithZone:zone];
        copy.serial = self.serial;
        copy.commonlyCount = self.commonlyCount;
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.listAttribute = [self.listAttribute copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.checkRes = [self.checkRes copyWithZone:zone];
        copy.size = self.size;
        copy.isCollect = self.isCollect;
        copy.badCount = self.badCount;
        copy.goodCount = self.goodCount;
        copy.msg = [self.msg copyWithZone:zone];
        copy.listComment = [self.listComment copyWithZone:zone];
    }
    
    return copy;
}


@end
