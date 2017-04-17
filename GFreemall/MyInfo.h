//
//  MyInfo.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double infoIdentifier;
@property (nonatomic, strong) NSString *basePhone;
@property (nonatomic, assign) id baseRegisterTime;
@property (nonatomic, assign) id baseIdcard;
@property (nonatomic, strong) NSString *baseLastloginIp;
@property (nonatomic, strong) NSString *baseUsername;
@property (nonatomic, assign) id baseEmail;
@property (nonatomic, strong) NSString *baseCountry;
@property (nonatomic, assign) double baseUuid;
@property (nonatomic, assign) double baseVisitCount;
@property (nonatomic, strong) NSString *baseName;
@property (nonatomic, assign) double baseLastloginTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
