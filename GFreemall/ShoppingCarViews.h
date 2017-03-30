//
//  ShoppingCarViews.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCarViews : UIView
@property(nonatomic,strong)MyButton *selectedBtn;
@property(nonatomic,strong)UILabel *picle;
@property(nonatomic,strong)MyButton *PaymentAndDeleteBtn;
@property(nonatomic,assign)BOOL state;
@end
