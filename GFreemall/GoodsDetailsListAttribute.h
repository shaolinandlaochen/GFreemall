//
//  GoodsDetailsListAttribute.h
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsListAttribute : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *eAttributeVal;
@property (nonatomic, strong) NSString *attributeName;
@property (nonatomic, strong) NSString *attributeNameEn;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
