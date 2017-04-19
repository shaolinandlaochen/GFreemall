//
//  AddressString.m
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AddressString.h"

@implementation AddressString
+(AddressString *)CommodityClassificationModel:(NSDictionary *)dic{
    
    AddressString *model=[[AddressString alloc]init];
    NSArray *allkeys=[dic allKeys];
    for (NSString *key in allkeys) {
        
        [model setValue:[dic objectForKey:key] forKey:key];
        
    }
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"id"]) {
        self.idStr=(NSString *)value;
    }
}
@end
