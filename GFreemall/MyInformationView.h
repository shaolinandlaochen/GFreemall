//
//  MyInformationView.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInformationView : UIView
@property(nonatomic,strong)MyButton *iconBtn;//头像
@property(nonatomic,strong)UILabel *name;//昵称
@property(nonatomic,strong)MyButton *level;//等级背景
@property(nonatomic,strong)MyButton *levelIcon;//等级图标
@property(nonatomic,strong)MyButton *levelName;//登记名称
@property(nonatomic,strong)UILabel *myOrder;//我的订单字段
@property(nonatomic,strong)MyButton *orderName;//我的订单按钮
@property(nonatomic,strong)MyButton *GoOrderIcon;//我的订单小箭头
@property(nonatomic,strong)MyButton *ForThePaymentBtn;//代付款
@property(nonatomic,strong)MyButton *ForTheGoods;//待收货
@property(nonatomic,strong)MyButton *ToEvaluate;//待评价
@property(nonatomic,strong)MyButton *HasBeenCompleted;//已完成
@property(nonatomic,strong)UILabel *redOne;//待付款小红点
@property(nonatomic,strong)UILabel *redTwo;//待收货小红点
@property(nonatomic,strong)UILabel *redThree;//待评价小红点
@property(nonatomic,strong)UILabel *redFour;//已完成小红点
@property(nonatomic,assign)NSInteger levelNumber;




@end
