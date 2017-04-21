//
//  PayThePasswordCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PayThePasswordDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法
//支付密码
-(void)Psw:(NSString *)pswString;


@end

@interface PayThePasswordCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,strong)UITextField *_tf;
@property(nonatomic,assign)id delegate;
@end
