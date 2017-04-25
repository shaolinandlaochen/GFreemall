//
//  MyInformationDataBaseClass.h
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyInformationDataBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double send;
@property (nonatomic, assign) double baseGrade;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double payment;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double comment;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
