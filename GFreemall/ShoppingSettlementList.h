//
//  ShoppingSettlementList.h
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShoppingSettlementCarts, ShoppingSettlementAttr;

@interface ShoppingSettlementList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ShoppingSettlementCarts *carts;
@property (nonatomic, strong) ShoppingSettlementAttr *attr;
@property (nonatomic, strong) NSString *attributes;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
