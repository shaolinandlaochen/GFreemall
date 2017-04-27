//
//  HomeBaseClass.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeBaseClass.h"
#import "HomeNews.h"
#import "HomeRecommend.h"
#import "HomeAds.h"
#import "HomeHot.h"


NSString *const kHomeBaseClassImgSrc = @"imgSrc";
NSString *const kHomeBaseClassNews = @"news";
NSString *const kHomeBaseClassRecommend = @"recommend";
NSString *const kHomeBaseClassAds = @"ads";
NSString *const kHomeBaseClassCode = @"code";
NSString *const kHomeBaseClassMsg = @"msg";
NSString *const kHomeBaseClassHot = @"hot";


@interface HomeBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeBaseClass

@synthesize imgSrc = _imgSrc;
@synthesize news = _news;
@synthesize recommend = _recommend;
@synthesize ads = _ads;
@synthesize code = _code;
@synthesize msg = _msg;
@synthesize hot = _hot;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.imgSrc = [self objectOrNilForKey:kHomeBaseClassImgSrc fromDictionary:dict];
    NSObject *receivedHomeNews = [dict objectForKey:kHomeBaseClassNews];
    NSMutableArray *parsedHomeNews = [NSMutableArray array];
    
    if ([receivedHomeNews isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeNews) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeNews addObject:[HomeNews modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeNews isKindOfClass:[NSDictionary class]]) {
       [parsedHomeNews addObject:[HomeNews modelObjectWithDictionary:(NSDictionary *)receivedHomeNews]];
    }

    self.news = [NSArray arrayWithArray:parsedHomeNews];
    NSObject *receivedHomeRecommend = [dict objectForKey:kHomeBaseClassRecommend];
    NSMutableArray *parsedHomeRecommend = [NSMutableArray array];
    
    if ([receivedHomeRecommend isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeRecommend) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeRecommend addObject:[HomeRecommend modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeRecommend isKindOfClass:[NSDictionary class]]) {
       [parsedHomeRecommend addObject:[HomeRecommend modelObjectWithDictionary:(NSDictionary *)receivedHomeRecommend]];
    }

    self.recommend = [NSArray arrayWithArray:parsedHomeRecommend];
            self.ads = [HomeAds modelObjectWithDictionary:[dict objectForKey:kHomeBaseClassAds]];
            self.code = [self objectOrNilForKey:kHomeBaseClassCode fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kHomeBaseClassMsg fromDictionary:dict];
    NSObject *receivedHomeHot = [dict objectForKey:kHomeBaseClassHot];
    NSMutableArray *parsedHomeHot = [NSMutableArray array];
    
    if ([receivedHomeHot isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeHot) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeHot addObject:[HomeHot modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeHot isKindOfClass:[NSDictionary class]]) {
       [parsedHomeHot addObject:[HomeHot modelObjectWithDictionary:(NSDictionary *)receivedHomeHot]];
    }

    self.hot = [NSArray arrayWithArray:parsedHomeHot];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgSrc forKey:kHomeBaseClassImgSrc];
    NSMutableArray *tempArrayForNews = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.news) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNews addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNews addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNews] forKey:kHomeBaseClassNews];
    NSMutableArray *tempArrayForRecommend = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.recommend) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecommend addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecommend addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecommend] forKey:kHomeBaseClassRecommend];
    [mutableDict setValue:[self.ads dictionaryRepresentation] forKey:kHomeBaseClassAds];
    [mutableDict setValue:self.code forKey:kHomeBaseClassCode];
    [mutableDict setValue:self.msg forKey:kHomeBaseClassMsg];
    NSMutableArray *tempArrayForHot = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.hot) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHot addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHot addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHot] forKey:kHomeBaseClassHot];

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

    self.imgSrc = [aDecoder decodeObjectForKey:kHomeBaseClassImgSrc];
    self.news = [aDecoder decodeObjectForKey:kHomeBaseClassNews];
    self.recommend = [aDecoder decodeObjectForKey:kHomeBaseClassRecommend];
    self.ads = [aDecoder decodeObjectForKey:kHomeBaseClassAds];
    self.code = [aDecoder decodeObjectForKey:kHomeBaseClassCode];
    self.msg = [aDecoder decodeObjectForKey:kHomeBaseClassMsg];
    self.hot = [aDecoder decodeObjectForKey:kHomeBaseClassHot];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgSrc forKey:kHomeBaseClassImgSrc];
    [aCoder encodeObject:_news forKey:kHomeBaseClassNews];
    [aCoder encodeObject:_recommend forKey:kHomeBaseClassRecommend];
    [aCoder encodeObject:_ads forKey:kHomeBaseClassAds];
    [aCoder encodeObject:_code forKey:kHomeBaseClassCode];
    [aCoder encodeObject:_msg forKey:kHomeBaseClassMsg];
    [aCoder encodeObject:_hot forKey:kHomeBaseClassHot];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeBaseClass *copy = [[HomeBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.news = [self.news copyWithZone:zone];
        copy.recommend = [self.recommend copyWithZone:zone];
        copy.ads = [self.ads copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.hot = [self.hot copyWithZone:zone];
    }
    
    return copy;
}


@end
