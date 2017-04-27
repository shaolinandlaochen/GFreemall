//
//  GFMSOrderMap.h
//
//  Created by   on 2017/4/27
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GFMSOrderMap : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double gfmAmount;
@property (nonatomic, assign) double orderPayment;
@property (nonatomic, assign) double orderPayAmount;
@property (nonatomic, assign) double currGfmPrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
