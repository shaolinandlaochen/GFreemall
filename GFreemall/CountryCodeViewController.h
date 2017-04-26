//
//  CountryCodeViewController.h
//  GFreemall
//
//  Created by 123 on 2017/4/26.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CountryCodeDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)codes:(NSInteger)index;


@end
@interface CountryCodeViewController : UIViewController
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)NSArray *array;
@end
