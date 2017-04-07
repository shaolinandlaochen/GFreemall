//
//  NewAddInputBoxCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewAddInputBoxCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)MyTextField *context;
@property(nonatomic,copy)NSString *string;
@property(nonatomic,copy)NSString *placeholder;
@end
