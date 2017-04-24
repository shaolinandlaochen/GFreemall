//
//  OrderListCommodity.h
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OrderListCommodity : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id commodityIscomment;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double commodityIdentifier;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, assign) double commodityFreight;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property (nonatomic, assign) double commodityQuantity;
@property (nonatomic, strong) NSString *commodityAttributes;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *commodityCoverImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
