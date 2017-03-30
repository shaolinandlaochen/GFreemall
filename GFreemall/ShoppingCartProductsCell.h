//
//  ShoppingCartProductsCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartProductsCell : UITableViewCell
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *describe;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)MyButton *selectedBtn;
@property(nonatomic,strong)MyButton *addBtn;
@property(nonatomic,strong)MyButton *deleteBtn;
@property(nonatomic,strong)MyImageView *bjImage;
@end
