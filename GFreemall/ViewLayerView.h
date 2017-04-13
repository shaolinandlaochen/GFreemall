//
//  ViewLayerView.h
//  GFreemall
//
//  Created by 123 on 2017/4/13.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewLayerView : UIView
@property(nonatomic,strong)UIView *prompt;
@property(nonatomic,strong)UILabel *tipStr;//提示
@property(nonatomic,strong)UIImageView  *BackgroundImage;//地下大背景
@property(nonatomic,assign)float quanQuan;
@property(nonatomic,strong)UILabel *percentage;
@property(nonatomic,strong)UILabel *number;
@property(nonatomic,strong)UILabel *time;



@property(nonatomic,strong)UILabel *state;//状态
@property(nonatomic,strong)UILabel *currentLayer;//当前层
@property(nonatomic,strong)UILabel *beginTime;//开始时间
@property(nonatomic,strong)UILabel *dataTime;//当前时间


@property(nonatomic,strong)UILabel *WhetherEarnings;//是否收益
@property(nonatomic,strong)UILabel *freezeMoney;//冻结资产
@property(nonatomic,strong)UILabel *GFMMoney;
@property(nonatomic,strong)MyButton *ViewLayerButton;


@end
