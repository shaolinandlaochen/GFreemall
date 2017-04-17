//
//  HomeAd2.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAd2.h"


NSString *const kHomeAd2AdsLinks = @"ads_links";
NSString *const kHomeAd2AdsPosition = @"ads_position";
NSString *const kHomeAd2AdsImages = @"ads_images";


@interface HomeAd2 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAd2

@synthesize adsLinks = _adsLinks;
@synthesize adsPosition = _adsPosition;
@synthesize adsImages = _adsImages;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.adsLinks = [self objectOrNilForKey:kHomeAd2AdsLinks fromDictionary:dict];
            self.adsPosition = [[self objectOrNilForKey:kHomeAd2AdsPosition fromDictionary:dict] doubleValue];
            self.adsImages = [self objectOrNilForKey:kHomeAd2AdsImages fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adsLinks forKey:kHomeAd2AdsLinks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsPosition] forKey:kHomeAd2AdsPosition];
    [mutableDict setValue:self.adsImages forKey:kHomeAd2AdsImages];

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

    self.adsLinks = [aDecoder decodeObjectForKey:kHomeAd2AdsLinks];
    self.adsPosition = [aDecoder decodeDoubleForKey:kHomeAd2AdsPosition];
    self.adsImages = [aDecoder decodeObjectForKey:kHomeAd2AdsImages];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adsLinks forKey:kHomeAd2AdsLinks];
    [aCoder encodeDouble:_adsPosition forKey:kHomeAd2AdsPosition];
    [aCoder encodeObject:_adsImages forKey:kHomeAd2AdsImages];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAd2 *copy = [[HomeAd2 alloc] init];
    
    
    
    if (copy) {

        copy.adsLinks = [self.adsLinks copyWithZone:zone];
        copy.adsPosition = self.adsPosition;
        copy.adsImages = [self.adsImages copyWithZone:zone];
    }
    
    return copy;
}


@end
