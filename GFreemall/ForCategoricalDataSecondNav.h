//
//  ForCategoricalDataSecondNav.h
//
//  Created by   on 2017/4/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ForCategoricalDataSecondNav : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double categoryPid;
@property (nonatomic, strong) NSString *categoryNameEn;
@property (nonatomic, strong) NSString *categoryNameTw;
@property (nonatomic, assign) id commodityImagesPath;
@property (nonatomic, assign) id commodityName;
@property (nonatomic, assign) id commoditySerial;
@property (nonatomic, assign) id commodityDigest;
@property (nonatomic, assign) id commodityCoverImage;
@property (nonatomic, assign) double categorySort;
@property (nonatomic, assign) double categorySerial;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) id commodityNameEn;
@property (nonatomic, assign) id commodityNameTw;
@property (nonatomic, assign) id commodityDigestEn;
@property (nonatomic, assign) id commodityDigestTw;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
