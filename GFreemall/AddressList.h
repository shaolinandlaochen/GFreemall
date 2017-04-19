//
//  AddressList.h
//
//  Created by   on 2017/4/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AddressList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *addressPhone;
@property (nonatomic, strong) NSString *addressCity;
@property (nonatomic, strong) NSString *addressArea;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *addressAddress;
@property (nonatomic, strong) NSString *addressProvince;
@property (nonatomic, strong) NSString *addressName;
@property (nonatomic, strong) NSString *addressZipcode;
@property (nonatomic, strong) NSString *addressCountry;
@property (nonatomic, assign) double addressIsdefault;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
