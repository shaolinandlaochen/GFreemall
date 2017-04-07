//
//  PaymentStatusViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PaymentStatusDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)PaymentStatus:(BOOL)why String:(NSString *)time;


@end
@interface PaymentStatusViewController : UIViewController
@property(nonatomic,assign)id delegate;
@end
