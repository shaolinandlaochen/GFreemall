//
//  WalletDetailsPagingList.m
//
//  Created by   on 2017/4/25
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "WalletDetailsPagingList.h"
#import "WalletDetailsResultList.h"


NSString *const kWalletDetailsPagingListCurrPage = @"currPage";
NSString *const kWalletDetailsPagingListTotalRecode = @"totalRecode";
NSString *const kWalletDetailsPagingListPageSize = @"pageSize";
NSString *const kWalletDetailsPagingListTotalPage = @"totalPage";
NSString *const kWalletDetailsPagingListResultList = @"resultList";


@interface WalletDetailsPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WalletDetailsPagingList

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
            self.currPage = [[self objectOrNilForKey:kWalletDetailsPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kWalletDetailsPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kWalletDetailsPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kWalletDetailsPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedWalletDetailsResultList = [dict objectForKey:kWalletDetailsPagingListResultList];
    NSMutableArray *parsedWalletDetailsResultList = [NSMutableArray array];
    
    if ([receivedWalletDetailsResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWalletDetailsResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWalletDetailsResultList addObject:[WalletDetailsResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWalletDetailsResultList isKindOfClass:[NSDictionary class]]) {
       [parsedWalletDetailsResultList addObject:[WalletDetailsResultList modelObjectWithDictionary:(NSDictionary *)receivedWalletDetailsResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedWalletDetailsResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kWalletDetailsPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kWalletDetailsPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kWalletDetailsPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kWalletDetailsPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kWalletDetailsPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kWalletDetailsPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kWalletDetailsPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kWalletDetailsPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kWalletDetailsPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kWalletDetailsPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kWalletDetailsPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kWalletDetailsPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kWalletDetailsPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kWalletDetailsPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kWalletDetailsPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    WalletDetailsPagingList *copy = [[WalletDetailsPagingList alloc] init];
    
    
    
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
