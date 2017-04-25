//
//  Top_UpPagingList.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Top_UpPagingList.h"
#import "Top_UpResultList.h"


NSString *const kTop_UpPagingListCurrPage = @"currPage";
NSString *const kTop_UpPagingListTotalRecode = @"totalRecode";
NSString *const kTop_UpPagingListPageSize = @"pageSize";
NSString *const kTop_UpPagingListTotalPage = @"totalPage";
NSString *const kTop_UpPagingListResultList = @"resultList";


@interface Top_UpPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top_UpPagingList

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
            self.currPage = [[self objectOrNilForKey:kTop_UpPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kTop_UpPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kTop_UpPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kTop_UpPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedTop_UpResultList = [dict objectForKey:kTop_UpPagingListResultList];
    NSMutableArray *parsedTop_UpResultList = [NSMutableArray array];
    
    if ([receivedTop_UpResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTop_UpResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTop_UpResultList addObject:[Top_UpResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTop_UpResultList isKindOfClass:[NSDictionary class]]) {
       [parsedTop_UpResultList addObject:[Top_UpResultList modelObjectWithDictionary:(NSDictionary *)receivedTop_UpResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedTop_UpResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kTop_UpPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kTop_UpPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kTop_UpPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kTop_UpPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kTop_UpPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kTop_UpPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kTop_UpPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kTop_UpPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kTop_UpPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kTop_UpPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kTop_UpPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kTop_UpPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kTop_UpPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kTop_UpPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kTop_UpPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    Top_UpPagingList *copy = [[Top_UpPagingList alloc] init];
    
    
    
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
