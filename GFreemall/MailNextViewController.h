//
//  MailNextViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MailNextViewDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法
-(void)MailNextViewButtonTitleString:(NSString *)name;
//

@end
@interface MailNextViewController : UIViewController
@property(nonatomic,copy)NSString *email;
@property(nonatomic,assign)id delegate;
@end
