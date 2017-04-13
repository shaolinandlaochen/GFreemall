//
//  GFMS.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TheModalDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)TheModal;
-(void)ButtonsAtTheBottom:(BOOL)smallAndBig;


@end
@interface GFMS : UIViewController
@property(nonatomic,assign)id delegate;

@end
