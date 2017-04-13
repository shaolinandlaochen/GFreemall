//
//  LineUp.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LineTheModalDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)LineTheModal;//判断是否出模态

-(void)LineButtonsAtTheBottom:(BOOL)smallAndBig;//控制底部tabbar大小


@end
@interface LineUp : UIViewController
@property(nonatomic,assign)id delegate;
@end
