//
//  RollOutTableViewCell.h
//  GFreemall
//
//  Created by 123 on 2017/4/12.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollOutTableViewCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,strong)MyTextField *tetfield;
@property(nonatomic,strong)UIButton *CodeBtn;
@property(nonatomic,strong)UILabel *name;
@end
