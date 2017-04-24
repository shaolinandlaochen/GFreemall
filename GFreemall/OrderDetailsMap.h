//
//  OrderDetailsMap.h
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OrderDetailsMap : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double baseUuid;
@property (nonatomic, strong) NSString *orderTime;
@property (nonatomic, strong) NSString *addressZipcode;
@property (nonatomic, strong) NSString *addressArea;
@property (nonatomic, assign) id orderPaytime;
@property (nonatomic, strong) NSString *addressProvince;
@property (nonatomic, strong) NSString *addressCity;
@property (nonatomic, assign) double orderPayIsmain;
@property (nonatomic, assign) double orderState;
@property (nonatomic, assign) double orderPayFreight;
@property (nonatomic, strong) NSString *orderSend;
@property (nonatomic, assign) id orderCanceltime;
@property (nonatomic, strong) NSString *addressPhone;
@property (nonatomic, assign) double orderSerial;
@property (nonatomic, assign) id orderSendtime;
@property (nonatomic, assign) double orderAmount;
@property (nonatomic, assign) double mapIdentifier;
@property (nonatomic, strong) NSString *addressAddress;
@property (nonatomic, assign) id orderLogCompany;
@property (nonatomic, assign) double orderFreight;
@property (nonatomic, strong) NSString *addressName;
@property (nonatomic, strong) NSString *orderSubSerial;
@property (nonatomic, strong) NSString *addressCountry;
@property (nonatomic, assign) double orderPayAmount;
@property (nonatomic, assign) double orderPayState;
@property (nonatomic, assign) double orderPayment;
@property (nonatomic, strong) NSArray *commodity;
@property (nonatomic, assign) id orderLogOrder;
@property (nonatomic, assign) double orderIsshow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
