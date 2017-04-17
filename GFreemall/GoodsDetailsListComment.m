//
//  GoodsDetailsListComment.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GoodsDetailsListComment.h"


NSString *const kGoodsDetailsListCommentCommoditySerial = @"commodity_serial";
NSString *const kGoodsDetailsListCommentId = @"id";
NSString *const kGoodsDetailsListCommentBaseGrade = @"base_grade";
NSString *const kGoodsDetailsListCommentOrderSerial = @"order_serial";
NSString *const kGoodsDetailsListCommentCommentContent = @"comment_content";
NSString *const kGoodsDetailsListCommentCommentGrade = @"comment_grade";
NSString *const kGoodsDetailsListCommentBaseUsername = @"base_username";
NSString *const kGoodsDetailsListCommentBaseEmail = @"base_email";
NSString *const kGoodsDetailsListCommentCommentReply = @"comment_reply";
NSString *const kGoodsDetailsListCommentCommentTime = @"comment_time";
NSString *const kGoodsDetailsListCommentCommentReplyTime = @"comment_reply_time";


@interface GoodsDetailsListComment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GoodsDetailsListComment

@synthesize commoditySerial = _commoditySerial;
@synthesize listCommentIdentifier = _listCommentIdentifier;
@synthesize baseGrade = _baseGrade;
@synthesize orderSerial = _orderSerial;
@synthesize commentContent = _commentContent;
@synthesize commentGrade = _commentGrade;
@synthesize baseUsername = _baseUsername;
@synthesize baseEmail = _baseEmail;
@synthesize commentReply = _commentReply;
@synthesize commentTime = _commentTime;
@synthesize commentReplyTime = _commentReplyTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commoditySerial = [[self objectOrNilForKey:kGoodsDetailsListCommentCommoditySerial fromDictionary:dict] doubleValue];
            self.listCommentIdentifier = [[self objectOrNilForKey:kGoodsDetailsListCommentId fromDictionary:dict] doubleValue];
            self.baseGrade = [[self objectOrNilForKey:kGoodsDetailsListCommentBaseGrade fromDictionary:dict] doubleValue];
            self.orderSerial = [[self objectOrNilForKey:kGoodsDetailsListCommentOrderSerial fromDictionary:dict] doubleValue];
            self.commentContent = [self objectOrNilForKey:kGoodsDetailsListCommentCommentContent fromDictionary:dict];
            self.commentGrade = [[self objectOrNilForKey:kGoodsDetailsListCommentCommentGrade fromDictionary:dict] doubleValue];
            self.baseUsername = [self objectOrNilForKey:kGoodsDetailsListCommentBaseUsername fromDictionary:dict];
            self.baseEmail = [self objectOrNilForKey:kGoodsDetailsListCommentBaseEmail fromDictionary:dict];
            self.commentReply = [self objectOrNilForKey:kGoodsDetailsListCommentCommentReply fromDictionary:dict];
            self.commentTime = [self objectOrNilForKey:kGoodsDetailsListCommentCommentTime fromDictionary:dict];
            self.commentReplyTime = [self objectOrNilForKey:kGoodsDetailsListCommentCommentReplyTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kGoodsDetailsListCommentCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listCommentIdentifier] forKey:kGoodsDetailsListCommentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseGrade] forKey:kGoodsDetailsListCommentBaseGrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kGoodsDetailsListCommentOrderSerial];
    [mutableDict setValue:self.commentContent forKey:kGoodsDetailsListCommentCommentContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentGrade] forKey:kGoodsDetailsListCommentCommentGrade];
    [mutableDict setValue:self.baseUsername forKey:kGoodsDetailsListCommentBaseUsername];
    [mutableDict setValue:self.baseEmail forKey:kGoodsDetailsListCommentBaseEmail];
    [mutableDict setValue:self.commentReply forKey:kGoodsDetailsListCommentCommentReply];
    [mutableDict setValue:self.commentTime forKey:kGoodsDetailsListCommentCommentTime];
    [mutableDict setValue:self.commentReplyTime forKey:kGoodsDetailsListCommentCommentReplyTime];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.commoditySerial = [aDecoder decodeDoubleForKey:kGoodsDetailsListCommentCommoditySerial];
    self.listCommentIdentifier = [aDecoder decodeDoubleForKey:kGoodsDetailsListCommentId];
    self.baseGrade = [aDecoder decodeDoubleForKey:kGoodsDetailsListCommentBaseGrade];
    self.orderSerial = [aDecoder decodeDoubleForKey:kGoodsDetailsListCommentOrderSerial];
    self.commentContent = [aDecoder decodeObjectForKey:kGoodsDetailsListCommentCommentContent];
    self.commentGrade = [aDecoder decodeDoubleForKey:kGoodsDetailsListCommentCommentGrade];
    self.baseUsername = [aDecoder decodeObjectForKey:kGoodsDetailsListCommentBaseUsername];
    self.baseEmail = [aDecoder decodeObjectForKey:kGoodsDetailsListCommentBaseEmail];
    self.commentReply = [aDecoder decodeObjectForKey:kGoodsDetailsListCommentCommentReply];
    self.commentTime = [aDecoder decodeObjectForKey:kGoodsDetailsListCommentCommentTime];
    self.commentReplyTime = [aDecoder decodeObjectForKey:kGoodsDetailsListCommentCommentReplyTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySerial forKey:kGoodsDetailsListCommentCommoditySerial];
    [aCoder encodeDouble:_listCommentIdentifier forKey:kGoodsDetailsListCommentId];
    [aCoder encodeDouble:_baseGrade forKey:kGoodsDetailsListCommentBaseGrade];
    [aCoder encodeDouble:_orderSerial forKey:kGoodsDetailsListCommentOrderSerial];
    [aCoder encodeObject:_commentContent forKey:kGoodsDetailsListCommentCommentContent];
    [aCoder encodeDouble:_commentGrade forKey:kGoodsDetailsListCommentCommentGrade];
    [aCoder encodeObject:_baseUsername forKey:kGoodsDetailsListCommentBaseUsername];
    [aCoder encodeObject:_baseEmail forKey:kGoodsDetailsListCommentBaseEmail];
    [aCoder encodeObject:_commentReply forKey:kGoodsDetailsListCommentCommentReply];
    [aCoder encodeObject:_commentTime forKey:kGoodsDetailsListCommentCommentTime];
    [aCoder encodeObject:_commentReplyTime forKey:kGoodsDetailsListCommentCommentReplyTime];
}

- (id)copyWithZone:(NSZone *)zone {
    GoodsDetailsListComment *copy = [[GoodsDetailsListComment alloc] init];
    
    
    
    if (copy) {

        copy.commoditySerial = self.commoditySerial;
        copy.listCommentIdentifier = self.listCommentIdentifier;
        copy.baseGrade = self.baseGrade;
        copy.orderSerial = self.orderSerial;
        copy.commentContent = [self.commentContent copyWithZone:zone];
        copy.commentGrade = self.commentGrade;
        copy.baseUsername = [self.baseUsername copyWithZone:zone];
        copy.baseEmail = [self.baseEmail copyWithZone:zone];
        copy.commentReply = [self.commentReply copyWithZone:zone];
        copy.commentTime = [self.commentTime copyWithZone:zone];
        copy.commentReplyTime = [self.commentReplyTime copyWithZone:zone];
    }
    
    return copy;
}


@end
