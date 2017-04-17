//
//  SearchPagingList.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SearchPagingList.h"
#import "SearchResultList.h"


NSString *const kSearchPagingListCurrPage = @"currPage";
NSString *const kSearchPagingListTotalRecode = @"totalRecode";
NSString *const kSearchPagingListPageSize = @"pageSize";
NSString *const kSearchPagingListTotalPage = @"totalPage";
NSString *const kSearchPagingListResultList = @"resultList";


@interface SearchPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SearchPagingList

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
            self.currPage = [[self objectOrNilForKey:kSearchPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kSearchPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kSearchPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kSearchPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedSearchResultList = [dict objectForKey:kSearchPagingListResultList];
    NSMutableArray *parsedSearchResultList = [NSMutableArray array];
    
    if ([receivedSearchResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSearchResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSearchResultList addObject:[SearchResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSearchResultList isKindOfClass:[NSDictionary class]]) {
       [parsedSearchResultList addObject:[SearchResultList modelObjectWithDictionary:(NSDictionary *)receivedSearchResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedSearchResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kSearchPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kSearchPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kSearchPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kSearchPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kSearchPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kSearchPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kSearchPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kSearchPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kSearchPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kSearchPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kSearchPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kSearchPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kSearchPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kSearchPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kSearchPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    SearchPagingList *copy = [[SearchPagingList alloc] init];
    
    
    
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
