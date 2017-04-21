//
//  AttributeSelectionViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/2.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShutDownDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//立即购买
-(void)BuyNowattr_input:(NSString *)attr_input message:(NSString *)Message number:(NSInteger)number;
//加入购物车
-(void)AddToCart:(NSString *)attr_input message:(NSString *)Message number:(NSInteger)number;
@end
@interface AttributeSelectionViewController : UIViewController
@property(nonatomic,assign)id deleghate;
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,strong)NSMutableArray *array;
@end
