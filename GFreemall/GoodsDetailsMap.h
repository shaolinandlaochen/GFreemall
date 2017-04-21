//
//  GoodsDetailsMap.h
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsMap : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double categorySerial;
@property (nonatomic, assign) double mapIdentifier;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double categoryPid;
@property (nonatomic, strong) NSString *firstName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
