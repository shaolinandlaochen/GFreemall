//
//  MyShippingAddress.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyShippingAddressDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)MyShippingAddressAddress_address:(NSString *)address_address address_area:(NSString *)address_area address_city:(NSString *)address_city address_country:(NSString *)address_country address_isdefault:(NSInteger)address_isdefault address_name:(NSString *)address_name address_phone:(NSString *)address_phone address_province:(NSString *)address_province address_zipcode:(NSString *)address_zipcode;


@end

@interface MyShippingAddress : UIViewController
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,assign)id delegate;
@property(nonatomic,copy)NSString *where;
@end
