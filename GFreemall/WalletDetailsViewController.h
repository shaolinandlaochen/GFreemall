//
//  WalletDetailsViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WalletDetailsViewController : UIViewController
@property(nonatomic,copy)NSString *were;
@property(nonatomic,strong)NSDictionary *dataDic;//充值记录
@property(nonatomic,copy)NSString *timeBegin;
@property(nonatomic,copy)NSString *timeEnd;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,copy)NSString *inStr;
@end
