//
//  ChooseShippingAddressOne.h
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChooseShippingAddressOneDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)SelecAreaIs;
@end
@interface ChooseShippingAddressOne : UIViewController
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,assign)id delegate;
@end
