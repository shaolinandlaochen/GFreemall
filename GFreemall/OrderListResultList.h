//
//  OrderListResultList.h
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OrderListResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double orderPayment;
@property (nonatomic, strong) NSString *addressZipcode;
@property (nonatomic, assign) double commodityQuantity;
@property (nonatomic, assign) double orderSerialOrder;
@property (nonatomic, strong) NSString *addressArea;
@property (nonatomic, strong) NSString *addressProvince;
@property (nonatomic, strong) NSString *addressCity;
@property (nonatomic, assign) id orderLogOrder;
@property (nonatomic, strong) NSString *commodityAttributes;
@property (nonatomic, assign) double commodityFreight;
@property (nonatomic, assign) double orderState;
@property (nonatomic, assign) double baseUuid;
@property (nonatomic, strong) NSString *addressPhone;
@property (nonatomic, assign) double orderSerial;
@property (nonatomic, assign) double categorySerial;
@property (nonatomic, assign) double orderId;
@property (nonatomic, assign) double orderAmount;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, strong) NSString *addressAddress;
@property (nonatomic, assign) id orderLogCompany;
@property (nonatomic, assign) double brandSerial;
@property (nonatomic, assign) double orderFreight;
@property (nonatomic, strong) NSString *addressName;
@property (nonatomic, assign) double commoditySellprice;
@property (nonatomic, strong) NSString *addressCountry;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, strong) NSArray *commodity;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) NSString *orderTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
