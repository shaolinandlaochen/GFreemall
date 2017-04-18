//
//  ProductEvaluationResultList.m
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ProductEvaluationResultList.h"


NSString *const kProductEvaluationResultListCommoditySerial = @"commodity_serial";
NSString *const kProductEvaluationResultListId = @"id";
NSString *const kProductEvaluationResultListBaseGrade = @"base_grade";
NSString *const kProductEvaluationResultListOrderSerial = @"order_serial";
NSString *const kProductEvaluationResultListCommentContent = @"comment_content";
NSString *const kProductEvaluationResultListCommentGrade = @"comment_grade";
NSString *const kProductEvaluationResultListBaseUsername = @"base_username";
NSString *const kProductEvaluationResultListBaseEmail = @"base_email";
NSString *const kProductEvaluationResultListCommentReply = @"comment_reply";
NSString *const kProductEvaluationResultListCommentTime = @"comment_time";
NSString *const kProductEvaluationResultListCommentReplyTime = @"comment_reply_time";


@interface ProductEvaluationResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductEvaluationResultList

@synthesize commoditySerial = _commoditySerial;
@synthesize resultListIdentifier = _resultListIdentifier;
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
            self.commoditySerial = [[self objectOrNilForKey:kProductEvaluationResultListCommoditySerial fromDictionary:dict] doubleValue];
            self.resultListIdentifier = [[self objectOrNilForKey:kProductEvaluationResultListId fromDictionary:dict] doubleValue];
            self.baseGrade = [[self objectOrNilForKey:kProductEvaluationResultListBaseGrade fromDictionary:dict] doubleValue];
            self.orderSerial = [[self objectOrNilForKey:kProductEvaluationResultListOrderSerial fromDictionary:dict] doubleValue];
            self.commentContent = [self objectOrNilForKey:kProductEvaluationResultListCommentContent fromDictionary:dict];
            self.commentGrade = [[self objectOrNilForKey:kProductEvaluationResultListCommentGrade fromDictionary:dict] doubleValue];
            self.baseUsername = [self objectOrNilForKey:kProductEvaluationResultListBaseUsername fromDictionary:dict];
            self.baseEmail = [self objectOrNilForKey:kProductEvaluationResultListBaseEmail fromDictionary:dict];
            self.commentReply = [self objectOrNilForKey:kProductEvaluationResultListCommentReply fromDictionary:dict];
            self.commentTime = [self objectOrNilForKey:kProductEvaluationResultListCommentTime fromDictionary:dict];
            self.commentReplyTime = [self objectOrNilForKey:kProductEvaluationResultListCommentReplyTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kProductEvaluationResultListCommoditySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kProductEvaluationResultListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseGrade] forKey:kProductEvaluationResultListBaseGrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kProductEvaluationResultListOrderSerial];
    [mutableDict setValue:self.commentContent forKey:kProductEvaluationResultListCommentContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentGrade] forKey:kProductEvaluationResultListCommentGrade];
    [mutableDict setValue:self.baseUsername forKey:kProductEvaluationResultListBaseUsername];
    [mutableDict setValue:self.baseEmail forKey:kProductEvaluationResultListBaseEmail];
    [mutableDict setValue:self.commentReply forKey:kProductEvaluationResultListCommentReply];
    [mutableDict setValue:self.commentTime forKey:kProductEvaluationResultListCommentTime];
    [mutableDict setValue:self.commentReplyTime forKey:kProductEvaluationResultListCommentReplyTime];

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

    self.commoditySerial = [aDecoder decodeDoubleForKey:kProductEvaluationResultListCommoditySerial];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kProductEvaluationResultListId];
    self.baseGrade = [aDecoder decodeDoubleForKey:kProductEvaluationResultListBaseGrade];
    self.orderSerial = [aDecoder decodeDoubleForKey:kProductEvaluationResultListOrderSerial];
    self.commentContent = [aDecoder decodeObjectForKey:kProductEvaluationResultListCommentContent];
    self.commentGrade = [aDecoder decodeDoubleForKey:kProductEvaluationResultListCommentGrade];
    self.baseUsername = [aDecoder decodeObjectForKey:kProductEvaluationResultListBaseUsername];
    self.baseEmail = [aDecoder decodeObjectForKey:kProductEvaluationResultListBaseEmail];
    self.commentReply = [aDecoder decodeObjectForKey:kProductEvaluationResultListCommentReply];
    self.commentTime = [aDecoder decodeObjectForKey:kProductEvaluationResultListCommentTime];
    self.commentReplyTime = [aDecoder decodeObjectForKey:kProductEvaluationResultListCommentReplyTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commoditySerial forKey:kProductEvaluationResultListCommoditySerial];
    [aCoder encodeDouble:_resultListIdentifier forKey:kProductEvaluationResultListId];
    [aCoder encodeDouble:_baseGrade forKey:kProductEvaluationResultListBaseGrade];
    [aCoder encodeDouble:_orderSerial forKey:kProductEvaluationResultListOrderSerial];
    [aCoder encodeObject:_commentContent forKey:kProductEvaluationResultListCommentContent];
    [aCoder encodeDouble:_commentGrade forKey:kProductEvaluationResultListCommentGrade];
    [aCoder encodeObject:_baseUsername forKey:kProductEvaluationResultListBaseUsername];
    [aCoder encodeObject:_baseEmail forKey:kProductEvaluationResultListBaseEmail];
    [aCoder encodeObject:_commentReply forKey:kProductEvaluationResultListCommentReply];
    [aCoder encodeObject:_commentTime forKey:kProductEvaluationResultListCommentTime];
    [aCoder encodeObject:_commentReplyTime forKey:kProductEvaluationResultListCommentReplyTime];
}

- (id)copyWithZone:(NSZone *)zone {
    ProductEvaluationResultList *copy = [[ProductEvaluationResultList alloc] init];
    
    
    
    if (copy) {

        copy.commoditySerial = self.commoditySerial;
        copy.resultListIdentifier = self.resultListIdentifier;
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
