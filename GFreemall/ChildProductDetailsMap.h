//
//  ChildProductDetailsMap.h
//
//  Created by   on 2017/4/28
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ChildProductDetailsMap : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commodityMarketprice;
@property (nonatomic, assign) double commodityReserves;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityImages;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double commodityDiscount;
@property (nonatomic, strong) NSString *commodityAttributes;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *commodityCoverImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
