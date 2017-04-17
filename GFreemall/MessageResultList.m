//
//  MessageResultList.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MessageResultList.h"


NSString *const kMessageResultListReadState = @"read_state";
NSString *const kMessageResultListMessageTarget = @"message_target";
NSString *const kMessageResultListDelState = @"del_state";
NSString *const kMessageResultListId = @"id";
NSString *const kMessageResultListMessageText = @"message_text";
NSString *const kMessageResultListMessageCategory = @"message_category";
NSString *const kMessageResultListMessageTargetGrade = @"message_target_grade";
NSString *const kMessageResultListMessageTime = @"message_time";
NSString *const kMessageResultListMessageTitle = @"message_title";


@interface MessageResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MessageResultList

@synthesize readState = _readState;
@synthesize messageTarget = _messageTarget;
@synthesize delState = _delState;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize messageText = _messageText;
@synthesize messageCategory = _messageCategory;
@synthesize messageTargetGrade = _messageTargetGrade;
@synthesize messageTime = _messageTime;
@synthesize messageTitle = _messageTitle;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.readState = [[self objectOrNilForKey:kMessageResultListReadState fromDictionary:dict] doubleValue];
            self.messageTarget = [[self objectOrNilForKey:kMessageResultListMessageTarget fromDictionary:dict] doubleValue];
            self.delState = [[self objectOrNilForKey:kMessageResultListDelState fromDictionary:dict] doubleValue];
            self.resultListIdentifier = [[self objectOrNilForKey:kMessageResultListId fromDictionary:dict] doubleValue];
            self.messageText = [self objectOrNilForKey:kMessageResultListMessageText fromDictionary:dict];
            self.messageCategory = [[self objectOrNilForKey:kMessageResultListMessageCategory fromDictionary:dict] doubleValue];
            self.messageTargetGrade = [self objectOrNilForKey:kMessageResultListMessageTargetGrade fromDictionary:dict];
            self.messageTime = [[self objectOrNilForKey:kMessageResultListMessageTime fromDictionary:dict] doubleValue];
            self.messageTitle = [self objectOrNilForKey:kMessageResultListMessageTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.readState] forKey:kMessageResultListReadState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.messageTarget] forKey:kMessageResultListMessageTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.delState] forKey:kMessageResultListDelState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kMessageResultListId];
    [mutableDict setValue:self.messageText forKey:kMessageResultListMessageText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.messageCategory] forKey:kMessageResultListMessageCategory];
    [mutableDict setValue:self.messageTargetGrade forKey:kMessageResultListMessageTargetGrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.messageTime] forKey:kMessageResultListMessageTime];
    [mutableDict setValue:self.messageTitle forKey:kMessageResultListMessageTitle];

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

    self.readState = [aDecoder decodeDoubleForKey:kMessageResultListReadState];
    self.messageTarget = [aDecoder decodeDoubleForKey:kMessageResultListMessageTarget];
    self.delState = [aDecoder decodeDoubleForKey:kMessageResultListDelState];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kMessageResultListId];
    self.messageText = [aDecoder decodeObjectForKey:kMessageResultListMessageText];
    self.messageCategory = [aDecoder decodeDoubleForKey:kMessageResultListMessageCategory];
    self.messageTargetGrade = [aDecoder decodeObjectForKey:kMessageResultListMessageTargetGrade];
    self.messageTime = [aDecoder decodeDoubleForKey:kMessageResultListMessageTime];
    self.messageTitle = [aDecoder decodeObjectForKey:kMessageResultListMessageTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_readState forKey:kMessageResultListReadState];
    [aCoder encodeDouble:_messageTarget forKey:kMessageResultListMessageTarget];
    [aCoder encodeDouble:_delState forKey:kMessageResultListDelState];
    [aCoder encodeDouble:_resultListIdentifier forKey:kMessageResultListId];
    [aCoder encodeObject:_messageText forKey:kMessageResultListMessageText];
    [aCoder encodeDouble:_messageCategory forKey:kMessageResultListMessageCategory];
    [aCoder encodeObject:_messageTargetGrade forKey:kMessageResultListMessageTargetGrade];
    [aCoder encodeDouble:_messageTime forKey:kMessageResultListMessageTime];
    [aCoder encodeObject:_messageTitle forKey:kMessageResultListMessageTitle];
}

- (id)copyWithZone:(NSZone *)zone {
    MessageResultList *copy = [[MessageResultList alloc] init];
    
    
    
    if (copy) {

        copy.readState = self.readState;
        copy.messageTarget = self.messageTarget;
        copy.delState = self.delState;
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.messageText = [self.messageText copyWithZone:zone];
        copy.messageCategory = self.messageCategory;
        copy.messageTargetGrade = [self.messageTargetGrade copyWithZone:zone];
        copy.messageTime = self.messageTime;
        copy.messageTitle = [self.messageTitle copyWithZone:zone];
    }
    
    return copy;
}


@end
