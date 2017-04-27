//
//  HomeAd7.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAd7.h"


NSString *const kHomeAd7AdsPosition = @"ads_position";
NSString *const kHomeAd7AdsImages = @"ads_images";
NSString *const kHomeAd7AdsLinks = @"ads_links";


@interface HomeAd7 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAd7

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
            self.adsPosition = [[self objectOrNilForKey:kHomeAd7AdsPosition fromDictionary:dict] doubleValue];
            self.adsImages = [self objectOrNilForKey:kHomeAd7AdsImages fromDictionary:dict];
            self.adsLinks = [self objectOrNilForKey:kHomeAd7AdsLinks fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsPosition] forKey:kHomeAd7AdsPosition];
    [mutableDict setValue:self.adsImages forKey:kHomeAd7AdsImages];
    [mutableDict setValue:self.adsLinks forKey:kHomeAd7AdsLinks];

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

    self.adsPosition = [aDecoder decodeDoubleForKey:kHomeAd7AdsPosition];
    self.adsImages = [aDecoder decodeObjectForKey:kHomeAd7AdsImages];
    self.adsLinks = [aDecoder decodeObjectForKey:kHomeAd7AdsLinks];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_adsPosition forKey:kHomeAd7AdsPosition];
    [aCoder encodeObject:_adsImages forKey:kHomeAd7AdsImages];
    [aCoder encodeObject:_adsLinks forKey:kHomeAd7AdsLinks];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAd7 *copy = [[HomeAd7 alloc] init];
    
    
    
    if (copy) {

        copy.adsPosition = self.adsPosition;
        copy.adsImages = [self.adsImages copyWithZone:zone];
        copy.adsLinks = [self.adsLinks copyWithZone:zone];
    }
    
    return copy;
}


@end
