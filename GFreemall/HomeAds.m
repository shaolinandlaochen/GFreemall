//
//  HomeAds.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAds.h"
#import "HomeAd2.h"
#import "HomeAd3.h"
#import "HomeAd4.h"
#import "HomeAd1.h"


NSString *const kHomeAdsAd2 = @"ad2";
NSString *const kHomeAdsAd3 = @"ad3";
NSString *const kHomeAdsAd4 = @"ad4";
NSString *const kHomeAdsAd1 = @"ad1";


@interface HomeAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAds

@synthesize ad2 = _ad2;
@synthesize ad3 = _ad3;
@synthesize ad4 = _ad4;
@synthesize ad1 = _ad1;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ad2 = [HomeAd2 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd2]];
            self.ad3 = [HomeAd3 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd3]];
            self.ad4 = [HomeAd4 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd4]];
    NSObject *receivedHomeAd1 = [dict objectForKey:kHomeAdsAd1];
    NSMutableArray *parsedHomeAd1 = [NSMutableArray array];
    
    if ([receivedHomeAd1 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeAd1) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeAd1 addObject:[HomeAd1 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeAd1 isKindOfClass:[NSDictionary class]]) {
       [parsedHomeAd1 addObject:[HomeAd1 modelObjectWithDictionary:(NSDictionary *)receivedHomeAd1]];
    }

    self.ad1 = [NSArray arrayWithArray:parsedHomeAd1];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.ad2 dictionaryRepresentation] forKey:kHomeAdsAd2];
    [mutableDict setValue:[self.ad3 dictionaryRepresentation] forKey:kHomeAdsAd3];
    [mutableDict setValue:[self.ad4 dictionaryRepresentation] forKey:kHomeAdsAd4];
    NSMutableArray *tempArrayForAd1 = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.ad1) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAd1 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAd1 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAd1] forKey:kHomeAdsAd1];

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

    self.ad2 = [aDecoder decodeObjectForKey:kHomeAdsAd2];
    self.ad3 = [aDecoder decodeObjectForKey:kHomeAdsAd3];
    self.ad4 = [aDecoder decodeObjectForKey:kHomeAdsAd4];
    self.ad1 = [aDecoder decodeObjectForKey:kHomeAdsAd1];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ad2 forKey:kHomeAdsAd2];
    [aCoder encodeObject:_ad3 forKey:kHomeAdsAd3];
    [aCoder encodeObject:_ad4 forKey:kHomeAdsAd4];
    [aCoder encodeObject:_ad1 forKey:kHomeAdsAd1];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAds *copy = [[HomeAds alloc] init];
    
    
    
    if (copy) {

        copy.ad2 = [self.ad2 copyWithZone:zone];
        copy.ad3 = [self.ad3 copyWithZone:zone];
        copy.ad4 = [self.ad4 copyWithZone:zone];
        copy.ad1 = [self.ad1 copyWithZone:zone];
    }
    
    return copy;
}


@end
