//
//  OrderListPagingList.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderListPagingList.h"
#import "OrderListResultList.h"


NSString *const kOrderListPagingListCurrPage = @"currPage";
NSString *const kOrderListPagingListTotalRecode = @"totalRecode";
NSString *const kOrderListPagingListPageSize = @"pageSize";
NSString *const kOrderListPagingListTotalPage = @"totalPage";
NSString *const kOrderListPagingListResultList = @"resultList";


@interface OrderListPagingList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderListPagingList

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
            self.currPage = [[self objectOrNilForKey:kOrderListPagingListCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kOrderListPagingListTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kOrderListPagingListPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kOrderListPagingListTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedOrderListResultList = [dict objectForKey:kOrderListPagingListResultList];
    NSMutableArray *parsedOrderListResultList = [NSMutableArray array];
    
    if ([receivedOrderListResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOrderListResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOrderListResultList addObject:[OrderListResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOrderListResultList isKindOfClass:[NSDictionary class]]) {
       [parsedOrderListResultList addObject:[OrderListResultList modelObjectWithDictionary:(NSDictionary *)receivedOrderListResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedOrderListResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kOrderListPagingListCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kOrderListPagingListTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kOrderListPagingListPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kOrderListPagingListTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kOrderListPagingListResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kOrderListPagingListCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kOrderListPagingListTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kOrderListPagingListPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kOrderListPagingListTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kOrderListPagingListResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kOrderListPagingListCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kOrderListPagingListTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kOrderListPagingListPageSize];
    [aCoder encodeDouble:_totalPage forKey:kOrderListPagingListTotalPage];
    [aCoder encodeObject:_resultList forKey:kOrderListPagingListResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderListPagingList *copy = [[OrderListPagingList alloc] init];
    
    
    
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
