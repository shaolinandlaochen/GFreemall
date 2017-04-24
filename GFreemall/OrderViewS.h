//
//  OrderViewS.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol OrderViewSDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)OrderTypeSwitch:(NSInteger)idx;


@end

@interface OrderViewS : UIView
@property(nonatomic,assign)id delegate;
@property(nonatomic,assign)NSInteger type;

@end
