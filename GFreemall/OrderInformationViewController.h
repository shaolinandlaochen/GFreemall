//
//  OrderInformationViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderInformationViewController : UIViewController
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,copy)NSString *address_address;
@property(nonatomic,copy)NSString *address_area;
@property(nonatomic,copy)NSString *address_city;
@property(nonatomic,copy)NSString *address_country;
@property(nonatomic,assign)NSInteger address_isdefault;
@property(nonatomic,copy)NSString *address_name;
@property(nonatomic,copy)NSString *address_phone;
@property(nonatomic,copy)NSString *address_province;
@property(nonatomic,copy)NSString *address_zipcode;
@property(nonatomic,copy)NSString *where;
@property(nonatomic,copy)NSString *number;
@property(nonatomic,copy)NSString *attribute;
@property(nonatomic,copy)NSString *checkRes;
@property(nonatomic,copy)NSString *comm_serial;
@property(nonatomic,copy)NSString *IDS;


@end
