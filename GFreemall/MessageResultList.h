//
//  MessageResultList.h
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MessageResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double readState;
@property (nonatomic, assign) double messageTarget;
@property (nonatomic, assign) double delState;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, strong) NSString *messageText;
@property (nonatomic, assign) double messageCategory;
@property (nonatomic, assign) id messageTargetGrade;
@property (nonatomic, assign) double messageTime;
@property (nonatomic, strong) NSString *messageTitle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
