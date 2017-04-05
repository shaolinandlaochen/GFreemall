//
//  paymentInformationView.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CancelTheViewDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)CancelTheView;
//c充值
-(void)oTop_UpGo;

@end
@interface paymentInformationView : UIViewController
@property(nonatomic,assign)id delegate;
@property(nonatomic,copy)NSString *were;

@end
