//
//  HomeAd4.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAd4.h"


NSString *const kHomeAd4AdsPosition = @"ads_position";
NSString *const kHomeAd4AdsImages = @"ads_images";
NSString *const kHomeAd4AdsLinks = @"ads_links";


@interface HomeAd4 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAd4

@synthesize adsPosition = _adsPosition;
@synthesize adsImages = _adsImages;
@synthesize adsLinks = _adsLinks;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.adsPosition = [[self objectOrNilForKey:kHomeAd4AdsPosition fromDictionary:dict] doubleValue];
            self.adsImages = [self objectOrNilForKey:kHomeAd4AdsImages fromDictionary:dict];
            self.adsLinks = [self objectOrNilForKey:kHomeAd4AdsLinks fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsPosition] forKey:kHomeAd4AdsPosition];
    [mutableDict setValue:self.adsImages forKey:kHomeAd4AdsImages];
    [mutableDict setValue:self.adsLinks forKey:kHomeAd4AdsLinks];

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

    self.adsPosition = [aDecoder decodeDoubleForKey:kHomeAd4AdsPosition];
    self.adsImages = [aDecoder decodeObjectForKey:kHomeAd4AdsImages];
    self.adsLinks = [aDecoder decodeObjectForKey:kHomeAd4AdsLinks];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_adsPosition forKey:kHomeAd4AdsPosition];
    [aCoder encodeObject:_adsImages forKey:kHomeAd4AdsImages];
    [aCoder encodeObject:_adsLinks forKey:kHomeAd4AdsLinks];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAd4 *copy = [[HomeAd4 alloc] init];
    
    
    
    if (copy) {

        copy.adsPosition = self.adsPosition;
        copy.adsImages = [self.adsImages copyWithZone:zone];
        copy.adsLinks = [self.adsLinks copyWithZone:zone];
    }
    
    return copy;
}


@end
