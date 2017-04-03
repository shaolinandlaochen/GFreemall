//
//  InputBoxCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputBoxCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,strong)UILabel *icon;
@property(nonatomic,strong)MyButton *btn;

@end
