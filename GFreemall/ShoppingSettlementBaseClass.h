//
//  ShoppingSettlementBaseClass.h
//
//  Created by   on 2017/4/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShoppingSettlementMapAddress;

@interface ShoppingSettlementBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double amountTotal;
@property (nonatomic, assign) double listAddressCount;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *listAddress;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSString *settleType;
@property (nonatomic, assign) double freight;
@property (nonatomic, strong) ShoppingSettlementMapAddress *mapAddress;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *commBox;
@property (nonatomic, assign) double disamount;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double cremain;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
