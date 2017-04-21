//
//  GoodsDetailsListComment.h
//
//  Created by   on 2017/4/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetailsListComment : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double listCommentIdentifier;
@property (nonatomic, assign) double baseGrade;
@property (nonatomic, assign) double orderSerial;
@property (nonatomic, strong) NSString *commentContent;
@property (nonatomic, assign) double commentGrade;
@property (nonatomic, strong) NSString *baseUsername;
@property (nonatomic, assign) id baseEmail;
@property (nonatomic, assign) id commentReply;
@property (nonatomic, strong) NSString *commentTime;
@property (nonatomic, assign) id commentReplyTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
