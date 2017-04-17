//
//  HomeBaseClass.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeBaseClass.h"
#import "HomeAds.h"
#import "HomeRecommend.h"
#import "HomeHot.h"
#import "HomeNews.h"


NSString *const kHomeBaseClassAds = @"ads";
NSString *const kHomeBaseClassImgSrc = @"imgSrc";
NSString *const kHomeBaseClassRecommend = @"recommend";
NSString *const kHomeBaseClassHot = @"hot";
NSString *const kHomeBaseClassNews = @"news";


@interface HomeBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeBaseClass

@synthesize ads = _ads;
@synthesize imgSrc = _imgSrc;
@synthesize recommend = _recommend;
@synthesize hot = _hot;
@synthesize news = _news;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ads = [HomeAds modelObjectWithDictionary:[dict objectForKey:kHomeBaseClassAds]];
            self.imgSrc = [self objectOrNilForKey:kHomeBaseClassImgSrc fromDictionary:dict];
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

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.ads dictionaryRepresentation] forKey:kHomeBaseClassAds];
    [mutableDict setValue:self.imgSrc forKey:kHomeBaseClassImgSrc];
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

    self.ads = [aDecoder decodeObjectForKey:kHomeBaseClassAds];
    self.imgSrc = [aDecoder decodeObjectForKey:kHomeBaseClassImgSrc];
    self.recommend = [aDecoder decodeObjectForKey:kHomeBaseClassRecommend];
    self.hot = [aDecoder decodeObjectForKey:kHomeBaseClassHot];
    self.news = [aDecoder decodeObjectForKey:kHomeBaseClassNews];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ads forKey:kHomeBaseClassAds];
    [aCoder encodeObject:_imgSrc forKey:kHomeBaseClassImgSrc];
    [aCoder encodeObject:_recommend forKey:kHomeBaseClassRecommend];
    [aCoder encodeObject:_hot forKey:kHomeBaseClassHot];
    [aCoder encodeObject:_news forKey:kHomeBaseClassNews];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeBaseClass *copy = [[HomeBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.ads = [self.ads copyWithZone:zone];
        copy.imgSrc = [self.imgSrc copyWithZone:zone];
        copy.recommend = [self.recommend copyWithZone:zone];
        copy.hot = [self.hot copyWithZone:zone];
        copy.news = [self.news copyWithZone:zone];
    }
    
    return copy;
}


@end
