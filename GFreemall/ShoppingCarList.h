//
//  ShoppingCarList.h
//
//  Created by   on 2017/4/18
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShoppingCarComm;

@interface ShoppingCarList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *commodityAttributes;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double commodityId;
@property (nonatomic, strong) NSString *commodityName;
@property (nonatomic, strong) ShoppingCarComm *comm;
@property(nonatomic,assign)BOOL selected;
@property(nonatomic,assign)BOOL EditorSelected;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
