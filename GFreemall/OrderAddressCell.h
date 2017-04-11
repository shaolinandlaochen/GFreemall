//
//  OrderAddressCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderAddressCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UILabel  *defaultStr;
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,strong)UIImageView *go;
@property(nonatomic,strong)UIImageView *img_line;
@end
