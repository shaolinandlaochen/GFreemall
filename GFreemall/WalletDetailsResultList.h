//
//  WalletDetailsResultList.h
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WalletDetailsResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cwalletRemain;
@property (nonatomic, assign) double cwalletAmount;
@property (nonatomic, strong) NSString *cwalletTime;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, assign) double baseUuid;
@property (nonatomic, strong) NSString *cwalletType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
