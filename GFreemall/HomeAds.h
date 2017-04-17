//
//  HomeAds.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeAd2, HomeAd3, HomeAd4;

@interface HomeAds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HomeAd2 *ad2;
@property (nonatomic, strong) HomeAd3 *ad3;
@property (nonatomic, strong) HomeAd4 *ad4;
@property (nonatomic, strong) NSArray *ad1;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
