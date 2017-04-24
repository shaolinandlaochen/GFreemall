//
//  OrderButtonView.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderButtonView : UIView
@property(nonatomic,strong)MyButton *btnOne;//取消
@property(nonatomic,strong)MyButton *BtnTwo;//去支付
@property(nonatomic,strong)UILabel *messageString;//已撤销
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)OrderListResultList *list;
@property(nonatomic,strong)OrderDetailsMap *map;
@end
