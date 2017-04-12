//
//  GFMCell.h
//  GFreemall
//
//  Created by 123 on 2017/4/11.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFMCell : UITableViewCell
@property(nonatomic,strong)UIImageView *bgImage;
@property(nonatomic,strong)UILabel *type;
@property(nonatomic,strong)UILabel *availableMoney;//可用钱
@property(nonatomic,strong)UILabel *FreezeMone;//冻结钱数
@property(nonatomic,strong)UILabel *TotalAssets;//总资产
@property(nonatomic,strong)MyButton  *RollOutBtn;//转出按钮
@property(nonatomic,strong)UIImageView *typeImg;//类型图
@property(nonatomic,strong)MyButton *CheckTheDetailsBtn;//查看明细
@end
