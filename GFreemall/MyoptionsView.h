//
//  MyoptionsView.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProductScreeningDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)ProductScreening:(MyButton *)btn;


@end
@interface MyoptionsView : UIView
@property (nonatomic, assign) id  delegate;
@property(nonatomic,assign)NSInteger ScrollPage;

@end
