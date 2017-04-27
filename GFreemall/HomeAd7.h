//
//  HomeAd7.h
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeAd7 : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double adsPosition;
@property (nonatomic, strong) NSString *adsImages;
@property (nonatomic, strong) NSString *adsLinks;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
