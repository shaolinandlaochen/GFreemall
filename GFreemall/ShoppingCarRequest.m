//
//  ShoppingCarRequest.m
//  GFreemall
//
//  Created by 123 on 2017/4/18.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShoppingCarRequest.h"

@implementation ShoppingCarRequest
//获取购车商品列表
+(void)ToGetAShoppingCartGoodsListBlock:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querycarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"获取购车商品列表----%@",dic);
        NSLog(@"get获取购车商品列表---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//接口删除购物车商品
+(void)DeleteTheGoods:(NSString *)box_id Block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:box_id forKey:@"box_id"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"delcarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"接口删除购物车商品----%@",dic);
        NSLog(@"get接口删除购物车商品---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];

}
//修改商品数量
+(void)ModifyTheQuantity:(int)quantity isSeneld:(BOOL)isend idx:(NSInteger)idx array:(NSArray *)array Block:(void(^)(NSDictionary *dics))block{
    ShoppingCarList *list=array[idx];
    //ShoppingCarComm *comm=list.comm;
    NSString *string;
    if (isend) {
        string=[NSString stringWithFormat:@"%d",quantity];
    }else{
    string=[NSString stringWithFormat:@"-%d",quantity];
    }
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:string forKey:@"count"];
    [dicData setObject:[NSString stringWithFormat:@"%.0f",list.listIdentifier] forKey:@"id"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"updcarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"修改商品数量----%@",dic);
        NSLog(@"get修改商品数量---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];




}
//购物车结算
+(void)TheShoppingCartAndSettlement:(NSString *)check_val Block:(void(^)(NSDictionary *dics))block{
    NSMutableDictionary *dicData=[[NSMutableDictionary alloc]init];
    if ([tokenString length]>0) {
        [dicData setObject:tokenString forKey:@"token"];
    }
    [dicData setObject:check_val forKey:@"check_val"];
    NSDictionary *data=[TheParentClass ReceiveTheOriginalData:dicData];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"settlecarts" Dic:data block:^(NSDictionary *dic) {
        NSLog(@"购物车结算----%@",dic);
        NSLog(@"get购物车结算---msg==%@",[dic objectForKey:@"msg"]);
        block(dic);
        
    }];
}
//用户点击cell的选中按钮这个方法用来判断是否全选并且计算价格
+(void)DetermineWhetherToChooseSelection:(NSArray *)array Block:(void(^)(BOOL isSend))blockks Block:(void(^)(NSString  *price))block{
    int x=0;
    float pic=0;
    for (int i=0; i<array.count; i++) {
        
        
        ShoppingCarList *list=array[i];
        ShoppingCarComm *comm=list.comm;
        if (list.selected==YES) {
            x+=1;
            pic+=(comm.commoditySellprice*list.count);
        }
        
    }
    BOOL isState;
    if (x==array.count) {
        isState=YES;
        
    }else{
         isState=NO;
    }
    blockks(isState);

    block([NSString stringWithFormat:@"%.2f",pic]);


}
//用户点击全选执行该方法
+(void)AUserClicksOnFutureGenerations:(BOOL)isSeleated Array:(NSArray *)array block:(void(^)(NSString *priceString))block{
   
    float pic=0;
    
    if (isSeleated) {//表示全部选中
        for (int i=0; i<array.count; i++) {
            ShoppingCarList *list=array[i];
            ShoppingCarComm *comm=list.comm;
            pic+=(comm.commoditySellprice*list.count);
            
        }
    }
    
  
    block([NSString stringWithFormat:@"%.2f",pic]);

}
//编辑状态下用户点击某行选中按钮//判断是不是需要全选
+(void)EditStateSelection:(NSArray *)array Block:(void(^)(BOOL isSend))block{
    
    int x=0;
    for (int i=0; i<array.count; i++) {
        
        ShoppingCarList *list=array[i];
        if (list.EditorSelected==YES) {
            x+=1;
        }
        
    }
    
    BOOL isState;
    if (x==array.count) {
        isState=YES;
        
    }else{
        isState=NO;
    }
    block(isState);
}
//删除购物车商品
+(void)DeleteShoppingCartOfGoods:(NSArray *)array block:(void(^)(NSString *IDString))block{

    NSString *idStr=@"";
    for (int i=0; i<array.count; i++) {
        
        ShoppingCarList *list=array[i];
        if (list.EditorSelected==YES) {
            if ([idStr length]<1) {
                idStr=[NSString stringWithFormat:@"%.0f",list.listIdentifier];
            }else{
                idStr=[NSString stringWithFormat:@"%@,%.0f",idStr,list.listIdentifier];
            }
        }
        
    }


    block(idStr);


}
//拼接将要支付的id
+(void)StitchingId:(NSArray *)array Block:(void(^)(NSString *IDS))block{
    NSString *idStr=@"";
    for (int i=0; i<array.count; i++) {
        
        ShoppingCarList *list=array[i];
        if (list.selected==YES) {
            if ([idStr length]<1) {
                idStr=[NSString stringWithFormat:@"%.0f",list.listIdentifier];
            }else{
                idStr=[NSString stringWithFormat:@"%@,%.0f",idStr,list.listIdentifier];
            }
        }
        
    }
    
    
    block(idStr);


}

@end
