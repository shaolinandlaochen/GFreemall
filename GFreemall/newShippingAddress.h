//
//  newShippingAddress.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol newShippingAddressOneDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)newShippingAddres;
@end
@interface newShippingAddress : UIViewController
@property(nonatomic,assign)id delegate;
@property(nonatomic,copy)NSString *address_country;
@property(nonatomic,copy)NSString *address_province;
@property(nonatomic,copy)NSString *address_city;
@property(nonatomic,copy)NSString *address_area;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *phoneNumber;
@property(nonatomic,copy)NSString *addressString;
@property(nonatomic,copy)NSString *why;
@property(nonatomic,assign)int ID;
@property(nonatomic,assign)BOOL isDefail;


@end
