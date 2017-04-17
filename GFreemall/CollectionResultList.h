//
//  CollectionResultList.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CollectionResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, strong) NSString *commodityCoverImage;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *commodityImagesPath;
@property(nonatomic,assign)BOOL selected;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
