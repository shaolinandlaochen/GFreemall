//
//  CollectionData.m
//
//  Created by   on 2017/4/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CollectionData.h"
#import "CollectionResultList.h"


NSString *const kCollectionDataCurrPage = @"currPage";
NSString *const kCollectionDataTotalRecode = @"totalRecode";
NSString *const kCollectionDataPageSize = @"pageSize";
NSString *const kCollectionDataTotalPage = @"totalPage";
NSString *const kCollectionDataResultList = @"resultList";


@interface CollectionData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CollectionData

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
            self.currPage = [[self objectOrNilForKey:kCollectionDataCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kCollectionDataTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kCollectionDataPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kCollectionDataTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedCollectionResultList = [dict objectForKey:kCollectionDataResultList];
    NSMutableArray *parsedCollectionResultList = [NSMutableArray array];
    
    if ([receivedCollectionResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCollectionResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCollectionResultList addObject:[CollectionResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCollectionResultList isKindOfClass:[NSDictionary class]]) {
       [parsedCollectionResultList addObject:[CollectionResultList modelObjectWithDictionary:(NSDictionary *)receivedCollectionResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedCollectionResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kCollectionDataCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kCollectionDataTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kCollectionDataPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kCollectionDataTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kCollectionDataResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kCollectionDataCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kCollectionDataTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kCollectionDataPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kCollectionDataTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kCollectionDataResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kCollectionDataCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kCollectionDataTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kCollectionDataPageSize];
    [aCoder encodeDouble:_totalPage forKey:kCollectionDataTotalPage];
    [aCoder encodeObject:_resultList forKey:kCollectionDataResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    CollectionData *copy = [[CollectionData alloc] init];
    
    
    
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
