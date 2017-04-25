//
//  WalletBaseClass.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "WalletBaseClass.h"


NSString *const kWalletBaseClassCremain = @"cremain";
NSString *const kWalletBaseClassMsg = @"msg";
NSString *const kWalletBaseClassCode = @"code";


@interface WalletBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WalletBaseClass

@synthesize cremain = _cremain;
@synthesize msg = _msg;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cremain = [[self objectOrNilForKey:kWalletBaseClassCremain fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kWalletBaseClassMsg fromDictionary:dict];
            self.code = [self objectOrNilForKey:kWalletBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cremain] forKey:kWalletBaseClassCremain];
    [mutableDict setValue:self.msg forKey:kWalletBaseClassMsg];
    [mutableDict setValue:self.code forKey:kWalletBaseClassCode];

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

    self.cremain = [aDecoder decodeDoubleForKey:kWalletBaseClassCremain];
    self.msg = [aDecoder decodeObjectForKey:kWalletBaseClassMsg];
    self.code = [aDecoder decodeObjectForKey:kWalletBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cremain forKey:kWalletBaseClassCremain];
    [aCoder encodeObject:_msg forKey:kWalletBaseClassMsg];
    [aCoder encodeObject:_code forKey:kWalletBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    WalletBaseClass *copy = [[WalletBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.cremain = self.cremain;
        copy.msg = [self.msg copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
