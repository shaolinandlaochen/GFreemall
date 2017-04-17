//
//  HomeAd1.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAd1.h"


NSString *const kHomeAd1AdsLinks = @"ads_links";
NSString *const kHomeAd1AdsPosition = @"ads_position";
NSString *const kHomeAd1AdsImages = @"ads_images";


@interface HomeAd1 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAd1

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
            self.adsLinks = [self objectOrNilForKey:kHomeAd1AdsLinks fromDictionary:dict];
            self.adsPosition = [[self objectOrNilForKey:kHomeAd1AdsPosition fromDictionary:dict] doubleValue];
            self.adsImages = [self objectOrNilForKey:kHomeAd1AdsImages fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adsLinks forKey:kHomeAd1AdsLinks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsPosition] forKey:kHomeAd1AdsPosition];
    [mutableDict setValue:self.adsImages forKey:kHomeAd1AdsImages];

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

    self.adsLinks = [aDecoder decodeObjectForKey:kHomeAd1AdsLinks];
    self.adsPosition = [aDecoder decodeDoubleForKey:kHomeAd1AdsPosition];
    self.adsImages = [aDecoder decodeObjectForKey:kHomeAd1AdsImages];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adsLinks forKey:kHomeAd1AdsLinks];
    [aCoder encodeDouble:_adsPosition forKey:kHomeAd1AdsPosition];
    [aCoder encodeObject:_adsImages forKey:kHomeAd1AdsImages];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAd1 *copy = [[HomeAd1 alloc] init];
    
    
    
    if (copy) {

        copy.adsLinks = [self.adsLinks copyWithZone:zone];
        copy.adsPosition = self.adsPosition;
        copy.adsImages = [self.adsImages copyWithZone:zone];
    }
    
    return copy;
}


@end
