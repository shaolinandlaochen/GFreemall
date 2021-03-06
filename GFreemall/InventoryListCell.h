//
//  InventoryListCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InventoryListCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *text;
@property(nonatomic,strong)UILabel *picre;
@property(nonatomic,strong)UILabel *freight;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)MyButton *icon;
@property(nonatomic,strong)ShoppingSettlementList *list;
@property(nonatomic,strong)ShoppingSettlementBaseClass *model;
@end
