//
//  BaseInputBoxCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BaseInputBoxDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法
//实名认证
-(void)Real_nameAuthentication:(MyTextField *)TextField;


@end
@interface BaseInputBoxCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)MyTextField *tf;
@property(nonatomic,strong)MyButton *btn;
@end
