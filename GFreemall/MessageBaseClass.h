//
//  MessageBaseClass.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MessageData;

@interface MessageBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) MessageData *data;
@property (nonatomic, strong) NSString *code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
