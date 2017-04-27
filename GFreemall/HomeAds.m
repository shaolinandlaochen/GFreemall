//
//  HomeAds.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAds.h"
#import "HomeAd6.h"
#import "HomeAd2.h"
#import "HomeAd5.h"
#import "HomeAd1.h"
#import "HomeAd4.h"
#import "HomeAd7.h"
#import "HomeAd3.h"


NSString *const kHomeAdsAd6 = @"ad6";
NSString *const kHomeAdsAd2 = @"ad2";
NSString *const kHomeAdsAd5 = @"ad5";
NSString *const kHomeAdsAd1 = @"ad1";
NSString *const kHomeAdsAd4 = @"ad4";
NSString *const kHomeAdsAd7 = @"ad7";
NSString *const kHomeAdsAd3 = @"ad3";


@interface HomeAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAds

@synthesize ad6 = _ad6;
@synthesize ad2 = _ad2;
@synthesize ad5 = _ad5;
@synthesize ad1 = _ad1;
@synthesize ad4 = _ad4;
@synthesize ad7 = _ad7;
@synthesize ad3 = _ad3;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ad6 = [HomeAd6 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd6]];
            self.ad2 = [HomeAd2 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd2]];
    NSObject *receivedHomeAd5 = [dict objectForKey:kHomeAdsAd5];
    NSMutableArray *parsedHomeAd5 = [NSMutableArray array];
    
    if ([receivedHomeAd5 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeAd5) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeAd5 addObject:[HomeAd5 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeAd5 isKindOfClass:[NSDictionary class]]) {
       [parsedHomeAd5 addObject:[HomeAd5 modelObjectWithDictionary:(NSDictionary *)receivedHomeAd5]];
    }

    self.ad5 = [NSArray arrayWithArray:parsedHomeAd5];
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
            self.ad4 = [HomeAd4 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd4]];
            self.ad7 = [HomeAd7 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd7]];
            self.ad3 = [HomeAd3 modelObjectWithDictionary:[dict objectForKey:kHomeAdsAd3]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.ad6 dictionaryRepresentation] forKey:kHomeAdsAd6];
    [mutableDict setValue:[self.ad2 dictionaryRepresentation] forKey:kHomeAdsAd2];
    NSMutableArray *tempArrayForAd5 = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.ad5) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAd5 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAd5 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAd5] forKey:kHomeAdsAd5];
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
    [mutableDict setValue:[self.ad4 dictionaryRepresentation] forKey:kHomeAdsAd4];
    [mutableDict setValue:[self.ad7 dictionaryRepresentation] forKey:kHomeAdsAd7];
    [mutableDict setValue:[self.ad3 dictionaryRepresentation] forKey:kHomeAdsAd3];

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

    self.ad6 = [aDecoder decodeObjectForKey:kHomeAdsAd6];
    self.ad2 = [aDecoder decodeObjectForKey:kHomeAdsAd2];
    self.ad5 = [aDecoder decodeObjectForKey:kHomeAdsAd5];
    self.ad1 = [aDecoder decodeObjectForKey:kHomeAdsAd1];
    self.ad4 = [aDecoder decodeObjectForKey:kHomeAdsAd4];
    self.ad7 = [aDecoder decodeObjectForKey:kHomeAdsAd7];
    self.ad3 = [aDecoder decodeObjectForKey:kHomeAdsAd3];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ad6 forKey:kHomeAdsAd6];
    [aCoder encodeObject:_ad2 forKey:kHomeAdsAd2];
    [aCoder encodeObject:_ad5 forKey:kHomeAdsAd5];
    [aCoder encodeObject:_ad1 forKey:kHomeAdsAd1];
    [aCoder encodeObject:_ad4 forKey:kHomeAdsAd4];
    [aCoder encodeObject:_ad7 forKey:kHomeAdsAd7];
    [aCoder encodeObject:_ad3 forKey:kHomeAdsAd3];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAds *copy = [[HomeAds alloc] init];
    
    
    
    if (copy) {

        copy.ad6 = [self.ad6 copyWithZone:zone];
        copy.ad2 = [self.ad2 copyWithZone:zone];
        copy.ad5 = [self.ad5 copyWithZone:zone];
        copy.ad1 = [self.ad1 copyWithZone:zone];
        copy.ad4 = [self.ad4 copyWithZone:zone];
        copy.ad7 = [self.ad7 copyWithZone:zone];
        copy.ad3 = [self.ad3 copyWithZone:zone];
    }
    
    return copy;
}


@end
