//
//  HomeAds.h
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeAd6, HomeAd2, HomeAd4, HomeAd7, HomeAd3;

@interface HomeAds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HomeAd6 *ad6;
@property (nonatomic, strong) HomeAd2 *ad2;
@property (nonatomic, strong) NSArray *ad5;
@property (nonatomic, strong) NSArray *ad1;
@property (nonatomic, strong) HomeAd4 *ad4;
@property (nonatomic, strong) HomeAd7 *ad7;
@property (nonatomic, strong) HomeAd3 *ad3;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
