//
//  AddressString.h
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressString : NSObject
@property(nonatomic,copy)NSString *idStr;
@property(nonatomic,copy)NSString *parentId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sort;
@property(nonatomic,strong)AddressString *parent;
@property(nonatomic,strong)NSMutableArray *list;
//获取数据 kvc
+(AddressString *)CommodityClassificationModel:(NSDictionary *)dic;
@end
