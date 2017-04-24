//
//  BasicInformationInfo.h
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BasicInformationInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *baseCountry;
@property (nonatomic, assign) double baseVisitCount;
@property (nonatomic, assign) double baseAuthEmail;
@property (nonatomic, assign) double baseGrade;
@property (nonatomic, assign) double baseState;
@property (nonatomic, assign) id baseRegisterTime;
@property (nonatomic, assign) double baseAuthName;
@property (nonatomic, assign) double baseIsshareholder;
@property (nonatomic, assign) double baseErrorIsfive;
@property (nonatomic, strong) NSString *baseUsername;
@property (nonatomic, assign) double baseAuthPwd;
@property (nonatomic, assign) id baseIdcard;
@property (nonatomic, strong) NSString *baseName;
@property (nonatomic, assign) double baseLastloginTime;
@property (nonatomic, assign) double baseAuthPhone;
@property (nonatomic, strong) NSString *baseLastloginIp;
@property (nonatomic, assign) double infoIdentifier;
@property (nonatomic, strong) NSString *basePhone;
@property (nonatomic, assign) id baseEmail;
@property (nonatomic, assign) double baseUuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
