//
//  BaseInputBoxCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseInputBoxCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,strong)MyTextField *tf;
@property(nonatomic,strong)MyButton *btn;
@end
