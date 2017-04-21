//
//  PayBaseClass.h
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PayBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *payType;
@property (nonatomic, strong) NSString *imgSrc;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *amountTotal;
@property (nonatomic, strong) NSString *serial;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
