//
//  PayThePasswordCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayThePasswordCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,strong)UITextField *_tf;
@end
