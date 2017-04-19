//
//  AddressBaseClass.m
//
//  Created by   on 2017/4/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AddressBaseClass.h"
#import "AddressList.h"


NSString *const kAddressBaseClassMsg = @"msg";
NSString *const kAddressBaseClassList = @"list";
NSString *const kAddressBaseClassCode = @"code";


@interface AddressBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AddressBaseClass

@synthesize msg = _msg;
@synthesize list = _list;
@synthesize code = _code;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.msg = [self objectOrNilForKey:kAddressBaseClassMsg fromDictionary:dict];
    NSObject *receivedAddressList = [dict objectForKey:kAddressBaseClassList];
    NSMutableArray *parsedAddressList = [NSMutableArray array];
    
    if ([receivedAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAddressList addObject:[AddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedAddressList addObject:[AddressList modelObjectWithDictionary:(NSDictionary *)receivedAddressList]];
    }

    self.list = [NSArray arrayWithArray:parsedAddressList];
            self.code = [self objectOrNilForKey:kAddressBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kAddressBaseClassMsg];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.list) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kAddressBaseClassList];
    [mutableDict setValue:self.code forKey:kAddressBaseClassCode];

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

    self.msg = [aDecoder decodeObjectForKey:kAddressBaseClassMsg];
    self.list = [aDecoder decodeObjectForKey:kAddressBaseClassList];
    self.code = [aDecoder decodeObjectForKey:kAddressBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kAddressBaseClassMsg];
    [aCoder encodeObject:_list forKey:kAddressBaseClassList];
    [aCoder encodeObject:_code forKey:kAddressBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    AddressBaseClass *copy = [[AddressBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
