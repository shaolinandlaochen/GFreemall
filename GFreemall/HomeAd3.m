//
//  HomeAd3.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAd3.h"


NSString *const kHomeAd3AdsLinks = @"ads_links";
NSString *const kHomeAd3AdsPosition = @"ads_position";
NSString *const kHomeAd3AdsImages = @"ads_images";


@interface HomeAd3 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAd3

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
            self.adsLinks = [self objectOrNilForKey:kHomeAd3AdsLinks fromDictionary:dict];
            self.adsPosition = [[self objectOrNilForKey:kHomeAd3AdsPosition fromDictionary:dict] doubleValue];
            self.adsImages = [self objectOrNilForKey:kHomeAd3AdsImages fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adsLinks forKey:kHomeAd3AdsLinks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsPosition] forKey:kHomeAd3AdsPosition];
    [mutableDict setValue:self.adsImages forKey:kHomeAd3AdsImages];

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

    self.adsLinks = [aDecoder decodeObjectForKey:kHomeAd3AdsLinks];
    self.adsPosition = [aDecoder decodeDoubleForKey:kHomeAd3AdsPosition];
    self.adsImages = [aDecoder decodeObjectForKey:kHomeAd3AdsImages];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adsLinks forKey:kHomeAd3AdsLinks];
    [aCoder encodeDouble:_adsPosition forKey:kHomeAd3AdsPosition];
    [aCoder encodeObject:_adsImages forKey:kHomeAd3AdsImages];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAd3 *copy = [[HomeAd3 alloc] init];
    
    
    
    if (copy) {

        copy.adsLinks = [self.adsLinks copyWithZone:zone];
        copy.adsPosition = self.adsPosition;
        copy.adsImages = [self.adsImages copyWithZone:zone];
    }
    
    return copy;
}


@end
