//
//  GoodsDetailsViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsDetailsViewController : UIViewController
@property(nonatomic,copy)NSString *commodity_serial;
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,copy)NSString *SKUString;
@property(nonatomic,copy)NSString *attr_input;
@property(nonatomic,strong)NSDictionary *ChildDic;
@end
