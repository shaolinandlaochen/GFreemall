//
//  MyInformationDataBaseClass.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyInformationDataBaseClass.h"


NSString *const kMyInformationDataBaseClassSend = @"send";
NSString *const kMyInformationDataBaseClassBaseGrade = @"base_grade";
NSString *const kMyInformationDataBaseClassCode = @"code";
NSString *const kMyInformationDataBaseClassPayment = @"payment";
NSString *const kMyInformationDataBaseClassUsername = @"username";
NSString *const kMyInformationDataBaseClassMsg = @"msg";
NSString *const kMyInformationDataBaseClassComment = @"comment";


@interface MyInformationDataBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyInformationDataBaseClass

@synthesize send = _send;
@synthesize baseGrade = _baseGrade;
@synthesize code = _code;
@synthesize payment = _payment;
@synthesize username = _username;
@synthesize msg = _msg;
@synthesize comment = _comment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.send = [[self objectOrNilForKey:kMyInformationDataBaseClassSend fromDictionary:dict] doubleValue];
            self.baseGrade = [[self objectOrNilForKey:kMyInformationDataBaseClassBaseGrade fromDictionary:dict] doubleValue];
            self.code = [self objectOrNilForKey:kMyInformationDataBaseClassCode fromDictionary:dict];
            self.payment = [[self objectOrNilForKey:kMyInformationDataBaseClassPayment fromDictionary:dict] doubleValue];
            self.username = [self objectOrNilForKey:kMyInformationDataBaseClassUsername fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kMyInformationDataBaseClassMsg fromDictionary:dict];
            self.comment = [[self objectOrNilForKey:kMyInformationDataBaseClassComment fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.send] forKey:kMyInformationDataBaseClassSend];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseGrade] forKey:kMyInformationDataBaseClassBaseGrade];
    [mutableDict setValue:self.code forKey:kMyInformationDataBaseClassCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.payment] forKey:kMyInformationDataBaseClassPayment];
    [mutableDict setValue:self.username forKey:kMyInformationDataBaseClassUsername];
    [mutableDict setValue:self.msg forKey:kMyInformationDataBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comment] forKey:kMyInformationDataBaseClassComment];

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

    self.send = [aDecoder decodeDoubleForKey:kMyInformationDataBaseClassSend];
    self.baseGrade = [aDecoder decodeDoubleForKey:kMyInformationDataBaseClassBaseGrade];
    self.code = [aDecoder decodeObjectForKey:kMyInformationDataBaseClassCode];
    self.payment = [aDecoder decodeDoubleForKey:kMyInformationDataBaseClassPayment];
    self.username = [aDecoder decodeObjectForKey:kMyInformationDataBaseClassUsername];
    self.msg = [aDecoder decodeObjectForKey:kMyInformationDataBaseClassMsg];
    self.comment = [aDecoder decodeDoubleForKey:kMyInformationDataBaseClassComment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_send forKey:kMyInformationDataBaseClassSend];
    [aCoder encodeDouble:_baseGrade forKey:kMyInformationDataBaseClassBaseGrade];
    [aCoder encodeObject:_code forKey:kMyInformationDataBaseClassCode];
    [aCoder encodeDouble:_payment forKey:kMyInformationDataBaseClassPayment];
    [aCoder encodeObject:_username forKey:kMyInformationDataBaseClassUsername];
    [aCoder encodeObject:_msg forKey:kMyInformationDataBaseClassMsg];
    [aCoder encodeDouble:_comment forKey:kMyInformationDataBaseClassComment];
}

- (id)copyWithZone:(NSZone *)zone {
    MyInformationDataBaseClass *copy = [[MyInformationDataBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.send = self.send;
        copy.baseGrade = self.baseGrade;
        copy.code = [self.code copyWithZone:zone];
        copy.payment = self.payment;
        copy.username = [self.username copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.comment = self.comment;
    }
    
    return copy;
}


@end
