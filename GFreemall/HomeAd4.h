//
//  HomeAd4.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeAd4 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *adsLinks;
@property (nonatomic, assign) double adsPosition;
@property (nonatomic, strong) NSString *adsImages;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
