//
//  MyInformationView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyInformationView.h"

@implementation MyInformationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    autoSize
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        //背景
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"bg"];
        [self addSubview:img];
        img.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(324*autoSizeScaleY);
        
        //头像
        _iconBtn=[[MyButton alloc]init];
        _iconBtn.layer.cornerRadius = 65*autoSizeScaleY;
        _iconBtn.layer.masksToBounds = 65*autoSizeScaleY;
        [_iconBtn setBackgroundImage:[UIImage imageNamed:@"pic_portrait"] forState:UIControlStateNormal];
        [self addSubview:_iconBtn];
        _iconBtn.sd_layout.leftSpaceToView(self, 309*autoSizeScaleX).topSpaceToView(self, 82*autoSizeScaleY).widthIs(131*autoSizeScaleX).heightIs(112*autoSizeScaleY);
        //名字
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _name.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(self, 0).topSpaceToView(_iconBtn, 10*autoSizeScaleY).rightSpaceToView(self, 0).heightIs(40*autoSizeScaleY);
        //等级背景
        _level=[[MyButton alloc]init];
        _level.layer.cornerRadius = 16*autoSizeScaleX;
        _level.layer.masksToBounds = 16*autoSizeScaleX;
        [self addSubview:_level];
        _level.sd_layout.leftSpaceToView(self, 310*autoSizeScaleX).topSpaceToView(_name, 16*autoSizeScaleY).widthIs(130*autoSizeScaleX).heightIs(32*autoSizeScaleY);
        //等级图标
        _levelIcon=[[MyButton alloc]init];
        [_level addSubview:_levelIcon];
        _levelIcon.sd_layout.leftSpaceToView(_level, 0).topSpaceToView(_level, 0).widthIs(32*autoSizeScaleY).heightIs(32*autoSizeScaleY);
        //等级名字
        _levelName=[[MyButton alloc]init];
        _levelName.titleLabel.font=[UIFont systemFontOfSize:20*autoSizeScaleX];
        [_levelName setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        [_level addSubview:_levelName];
        _levelName.sd_layout.leftSpaceToView(_levelIcon, 0).topEqualToView(_levelIcon).rightSpaceToView(_level, 0).heightIs(32*autoSizeScaleY);
        
        //线
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
        [self addSubview:view];
        view.sd_layout.leftSpaceToView(self, 0).topSpaceToView(img, 96*autoSizeScaleY).rightSpaceToView(self, 0).heightIs(0.6);
        //我的订单
        _myOrder=[[UILabel alloc]init];
        _myOrder.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _myOrder.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self addSubview:_myOrder];
        _myOrder.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(img, 0).widthIs(100).heightIs(96*autoSizeScaleX);
        _myOrder.text=Localized(@"我的订单");
        //小箭头
        _GoOrderIcon=[[MyButton alloc]init];
        [_GoOrderIcon setBackgroundImage:[UIImage imageNamed:@"icon_right"] forState:UIControlStateNormal];
        [self addSubview:_GoOrderIcon];
        _GoOrderIcon.sd_layout.topSpaceToView(img, 23*autoSizeScaleY).rightSpaceToView(self, 8*autoSizeScaleX).heightIs(44*autoSizeScaleY).widthIs(44*autoSizeScaleX);
        //点击查看订单
        _orderName=[[MyButton alloc]init];
        [_orderName setTitleColor:[TheParentClass colorWithHexString:@"999999"] forState:UIControlStateNormal];
        _orderName.titleLabel.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [_orderName setTitle:Localized(@"查看全部订单") forState:UIControlStateNormal];
        [self addSubview:_orderName];
        _orderName.sd_layout.topEqualToView(_GoOrderIcon).rightSpaceToView(_GoOrderIcon, 10*autoSizeScaleX).heightIs(44*autoSizeScaleY).widthIs(160*autoSizeScaleX);
        
        //图标加名字
        NSArray *imgArray=@[@"icon_pay",@"icon_goods",@"icon_comment",@"icon_complete"];
        NSArray *nameMessgaeArray=@[@"待付款",@"待收货",@"待评价",@"已完成"];
        for (int i=0; i<4; i++) {
            float x=72+(44+147)*(i%4);
            UIImageView *img=[[UIImageView alloc]init];
            img.image=[UIImage imageNamed:imgArray[i]];
            [self addSubview:img];
            img.sd_layout.leftSpaceToView(self, x*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
            float xx=55+(80+110)*(i%4);
            UILabel *nameMessage=[[UILabel alloc]init];
            nameMessage.textColor=[TheParentClass colorWithHexString:@"#292929"];
            nameMessage.font=[UIFont systemFontOfSize:22*autoSizeScaleY];
            nameMessage.text=Localized(nameMessgaeArray[i]);
            nameMessage.textAlignment=NSTextAlignmentCenter;
            [self addSubview:nameMessage];
            nameMessage.sd_layout.leftSpaceToView(self, xx*autoSizeScaleX).topSpaceToView(img, 10*autoSizeScaleY).widthIs(80*autoSizeScaleX).heightIs(30*autoSizeScaleY);
            
            
        }
        //覆盖按钮
        //d待付款
        _ForThePaymentBtn=[[MyButton alloc]init];
        _ForThePaymentBtn.tag=100;
        [self addSubview:_ForThePaymentBtn];
        _ForThePaymentBtn.sd_layout.leftSpaceToView(self, 0).topSpaceToView(view, 0).widthIs(187.5*autoSizeScaleX).bottomSpaceToView(self, 0);
        //待收货
        _ForTheGoods=[[MyButton alloc]init];
        _ForTheGoods.tag=101;
        [self addSubview:_ForTheGoods];
        _ForTheGoods.sd_layout.leftSpaceToView(_ForThePaymentBtn, 0).topEqualToView(_ForThePaymentBtn).widthIs(187.5*autoSizeScaleX).bottomEqualToView(_ForThePaymentBtn);
        //待评价
        _ToEvaluate=[[MyButton alloc]init];
        _ToEvaluate.tag=102;
        [self addSubview:_ToEvaluate];
        _ToEvaluate.sd_layout.leftSpaceToView(_ForTheGoods, 0).topEqualToView(_ForThePaymentBtn).widthIs(187.5*autoSizeScaleX).bottomEqualToView(_ForThePaymentBtn);
        //已完成
        _HasBeenCompleted=[[MyButton alloc]init];
        _HasBeenCompleted.tag=103;
        [self addSubview:_HasBeenCompleted];
        _HasBeenCompleted.sd_layout.leftSpaceToView(_ToEvaluate, 0).topEqualToView(_ForThePaymentBtn).widthIs(187.5*autoSizeScaleX).bottomEqualToView(_ForThePaymentBtn);
        
        //下面是小红点依次排序
        _redOne=[[UILabel alloc]init];
        _redOne.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
        _redOne.layer.cornerRadius = 13*autoSizeScaleX;
        _redOne.layer.masksToBounds = 13*autoSizeScaleX;
        _redOne.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        _redOne.textColor=[UIColor whiteColor];
        _redOne.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_redOne];
        _redOne.sd_layout.leftSpaceToView(self, 100*autoSizeScaleX).topSpaceToView(view, 15*autoSizeScaleY).widthIs(26*autoSizeScaleX).heightIs(26*autoSizeScaleY);
        
        _redTwo=[[UILabel alloc]init];
        _redTwo.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
        _redTwo.layer.cornerRadius = 13*autoSizeScaleX;
        _redTwo.layer.masksToBounds = 13*autoSizeScaleX;
        _redTwo.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        _redTwo.textColor=[UIColor whiteColor];
        _redTwo.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_redTwo];
        _redTwo.sd_layout.leftSpaceToView(self, 290*autoSizeScaleX).topEqualToView(_redOne).widthIs(26*autoSizeScaleX).heightIs(26*autoSizeScaleY);
        
        _redThree=[[UILabel alloc]init];
        _redThree.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
        _redThree.layer.cornerRadius = 13*autoSizeScaleX;
        _redThree.layer.masksToBounds = 13*autoSizeScaleX;
        _redThree.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        _redThree.textColor=[UIColor whiteColor];
        _redThree.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_redThree];
        _redThree.sd_layout.topEqualToView(_redOne).heightIs(26*autoSizeScaleY).widthIs(26*autoSizeScaleX).leftSpaceToView(self, 475*autoSizeScaleX);
        
        _redFour=[[UILabel alloc]init];
        _redFour.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
        _redFour.layer.cornerRadius = 13*autoSizeScaleX;
        _redFour.layer.masksToBounds = 13*autoSizeScaleX;
        _redFour.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        _redFour.textColor=[UIColor whiteColor];
        _redFour.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_redFour];
        _redFour.sd_layout.topEqualToView(_redOne).heightIs(26*autoSizeScaleY).widthIs(26*autoSizeScaleX).leftSpaceToView(self, 665*autoSizeScaleX);
        
  
        
    }
    return self;
}
-(void)setLevelNumber:(NSInteger)levelNumber{

    
    NSLog(@"aaaaaaaaaaa___%ld",levelNumber);
    
    switch (levelNumber) {
        case 0://注册
        {
            _level.backgroundColor=[TheParentClass colorWithHexString:@"fffbd4"];
            [_levelIcon setBackgroundImage:[UIImage imageNamed:@"member_register"] forState:UIControlStateNormal];
            [_levelName setTitle:@"注册会员" forState:UIControlStateNormal];
        }
            break;
        case 1://铜牌
        {
            _level.backgroundColor=[TheParentClass colorWithHexString:@"fffbd4"];
            [_levelIcon setBackgroundImage:[UIImage imageNamed:@"member_copper"] forState:UIControlStateNormal];
            [_levelName setTitle:@"铜牌会员" forState:UIControlStateNormal];
        }
            break;
        case 2://银牌
        {
            _level.backgroundColor=[TheParentClass colorWithHexString:@"fffbd4"];
            [_levelIcon setBackgroundImage:[UIImage imageNamed:@"member_silver"] forState:UIControlStateNormal];
            [_levelName setTitle:@"银牌会员" forState:UIControlStateNormal];
        }
            break;
        case 3://金牌
        {
            _level.backgroundColor=[TheParentClass colorWithHexString:@"fffbd4"];
            [_levelIcon setBackgroundImage:[UIImage imageNamed:@"member_diamond"] forState:UIControlStateNormal];
            [_levelName setTitle:@"黄金会员" forState:UIControlStateNormal];
            
        }
            break;
        case 4://钻石
        {
            _level.backgroundColor=[TheParentClass colorWithHexString:@"fffbd4"];
            [_levelIcon setBackgroundImage:[UIImage imageNamed:@"member_diamond"] forState:UIControlStateNormal];
            [_levelName setTitle:@"钻石会员" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }



}
@end
