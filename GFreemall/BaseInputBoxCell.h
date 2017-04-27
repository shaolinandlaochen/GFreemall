//
//  BaseInputBoxCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ReplaceAPhoneNumberViewController.h"
#import "MailNextViewController.h"
@protocol BaseInputBoxDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法
//返回输入字符串
-(void)ToObtainInputBox:(MyTextField *)TextField;
//

@end
@interface BaseInputBoxCell : UITableViewCell<UITextFieldDelegate,ReplaceAPhoneNumberDelegate,MailNextViewDelegate>
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)MyTextField *tf;
@property(nonatomic,strong)MyButton *btn;
@property(nonatomic,strong)MyButton *CHOOSE;
@property(nonatomic,strong)UIImageView *imgTopBo;
@property(nonatomic,copy)NSString *stringBtnTitle;
@end
