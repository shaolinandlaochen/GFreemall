//
//  ChooseShippingAddressTwo.h
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChooseShippingAddressTwoDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)ChooseShippingAddressTwoSelecAreaIs:(NSArray *)array;
@end
@interface ChooseShippingAddressTwo : UIViewController
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSArray *addressStringArray;
@property(nonatomic,strong)NSMutableArray *addressArray;
@property(nonatomic,assign)id delegate;
@end
