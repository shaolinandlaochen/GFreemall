//
//  MessageData.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MessageData.h"
#import "MessageResultList.h"


NSString *const kMessageDataCurrPage = @"currPage";
NSString *const kMessageDataTotalRecode = @"totalRecode";
NSString *const kMessageDataPageSize = @"pageSize";
NSString *const kMessageDataTotalPage = @"totalPage";
NSString *const kMessageDataResultList = @"resultList";


@interface MessageData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MessageData

@synthesize currPage = _currPage;
@synthesize totalRecode = _totalRecode;
@synthesize pageSize = _pageSize;
@synthesize totalPage = _totalPage;
@synthesize resultList = _resultList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.currPage = [[self objectOrNilForKey:kMessageDataCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kMessageDataTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kMessageDataPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kMessageDataTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedMessageResultList = [dict objectForKey:kMessageDataResultList];
    NSMutableArray *parsedMessageResultList = [NSMutableArray array];
    
    if ([receivedMessageResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMessageResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMessageResultList addObject:[MessageResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMessageResultList isKindOfClass:[NSDictionary class]]) {
       [parsedMessageResultList addObject:[MessageResultList modelObjectWithDictionary:(NSDictionary *)receivedMessageResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedMessageResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kMessageDataCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kMessageDataTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kMessageDataPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kMessageDataTotalPage];
    NSMutableArray *tempArrayForResultList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.resultList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResultList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResultList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kMessageDataResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kMessageDataCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kMessageDataTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kMessageDataPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kMessageDataTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kMessageDataResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kMessageDataCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kMessageDataTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kMessageDataPageSize];
    [aCoder encodeDouble:_totalPage forKey:kMessageDataTotalPage];
    [aCoder encodeObject:_resultList forKey:kMessageDataResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    MessageData *copy = [[MessageData alloc] init];
    
    
    
    if (copy) {

        copy.currPage = self.currPage;
        copy.totalRecode = self.totalRecode;
        copy.pageSize = self.pageSize;
        copy.totalPage = self.totalPage;
        copy.resultList = [self.resultList copyWithZone:zone];
    }
    
    return copy;
}


@end
