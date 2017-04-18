//
//  ProductEvaluationListComment.m
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ProductEvaluationListComment.h"
#import "ProductEvaluationResultList.h"


NSString *const kProductEvaluationListCommentCurrPage = @"currPage";
NSString *const kProductEvaluationListCommentTotalRecode = @"totalRecode";
NSString *const kProductEvaluationListCommentPageSize = @"pageSize";
NSString *const kProductEvaluationListCommentTotalPage = @"totalPage";
NSString *const kProductEvaluationListCommentResultList = @"resultList";


@interface ProductEvaluationListComment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductEvaluationListComment

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
            self.currPage = [[self objectOrNilForKey:kProductEvaluationListCommentCurrPage fromDictionary:dict] doubleValue];
            self.totalRecode = [[self objectOrNilForKey:kProductEvaluationListCommentTotalRecode fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kProductEvaluationListCommentPageSize fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kProductEvaluationListCommentTotalPage fromDictionary:dict] doubleValue];
    NSObject *receivedProductEvaluationResultList = [dict objectForKey:kProductEvaluationListCommentResultList];
    NSMutableArray *parsedProductEvaluationResultList = [NSMutableArray array];
    
    if ([receivedProductEvaluationResultList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedProductEvaluationResultList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedProductEvaluationResultList addObject:[ProductEvaluationResultList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedProductEvaluationResultList isKindOfClass:[NSDictionary class]]) {
       [parsedProductEvaluationResultList addObject:[ProductEvaluationResultList modelObjectWithDictionary:(NSDictionary *)receivedProductEvaluationResultList]];
    }

    self.resultList = [NSArray arrayWithArray:parsedProductEvaluationResultList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currPage] forKey:kProductEvaluationListCommentCurrPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRecode] forKey:kProductEvaluationListCommentTotalRecode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kProductEvaluationListCommentPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kProductEvaluationListCommentTotalPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultList] forKey:kProductEvaluationListCommentResultList];

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

    self.currPage = [aDecoder decodeDoubleForKey:kProductEvaluationListCommentCurrPage];
    self.totalRecode = [aDecoder decodeDoubleForKey:kProductEvaluationListCommentTotalRecode];
    self.pageSize = [aDecoder decodeDoubleForKey:kProductEvaluationListCommentPageSize];
    self.totalPage = [aDecoder decodeDoubleForKey:kProductEvaluationListCommentTotalPage];
    self.resultList = [aDecoder decodeObjectForKey:kProductEvaluationListCommentResultList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currPage forKey:kProductEvaluationListCommentCurrPage];
    [aCoder encodeDouble:_totalRecode forKey:kProductEvaluationListCommentTotalRecode];
    [aCoder encodeDouble:_pageSize forKey:kProductEvaluationListCommentPageSize];
    [aCoder encodeDouble:_totalPage forKey:kProductEvaluationListCommentTotalPage];
    [aCoder encodeObject:_resultList forKey:kProductEvaluationListCommentResultList];
}

- (id)copyWithZone:(NSZone *)zone {
    ProductEvaluationListComment *copy = [[ProductEvaluationListComment alloc] init];
    
    
    
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
