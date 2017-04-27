//
//  HomeAd5.m
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAd5.h"


NSString *const kHomeAd5AdsPosition = @"ads_position";
NSString *const kHomeAd5AdsImages = @"ads_images";
NSString *const kHomeAd5AdsLinks = @"ads_links";


@interface HomeAd5 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAd5

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
            self.adsPosition = [[self objectOrNilForKey:kHomeAd5AdsPosition fromDictionary:dict] doubleValue];
            self.adsImages = [self objectOrNilForKey:kHomeAd5AdsImages fromDictionary:dict];
            self.adsLinks = [self objectOrNilForKey:kHomeAd5AdsLinks fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsPosition] forKey:kHomeAd5AdsPosition];
    [mutableDict setValue:self.adsImages forKey:kHomeAd5AdsImages];
    [mutableDict setValue:self.adsLinks forKey:kHomeAd5AdsLinks];

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

    self.adsPosition = [aDecoder decodeDoubleForKey:kHomeAd5AdsPosition];
    self.adsImages = [aDecoder decodeObjectForKey:kHomeAd5AdsImages];
    self.adsLinks = [aDecoder decodeObjectForKey:kHomeAd5AdsLinks];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_adsPosition forKey:kHomeAd5AdsPosition];
    [aCoder encodeObject:_adsImages forKey:kHomeAd5AdsImages];
    [aCoder encodeObject:_adsLinks forKey:kHomeAd5AdsLinks];
}

- (id)copyWithZone:(NSZone *)zone {
    HomeAd5 *copy = [[HomeAd5 alloc] init];
    
    
    
    if (copy) {

        copy.adsPosition = self.adsPosition;
        copy.adsImages = [self.adsImages copyWithZone:zone];
        copy.adsLinks = [self.adsLinks copyWithZone:zone];
    }
    
    return copy;
}


@end
