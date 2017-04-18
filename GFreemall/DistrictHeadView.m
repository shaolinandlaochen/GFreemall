//
//  DistrictHeadView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "DistrictHeadView.h"

@implementation DistrictHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        autoSize
        self.backgroundColor=[UIColor whiteColor];
        _icon=[[UIImageView alloc]init];
        _icon.image=[UIImage imageNamed:@"icon_copper1"];
        [self addSubview:_icon];
        _icon.sd_layout.leftSpaceToView(self, 24*autoSizeScaleX).topSpaceToView(self, 22*autoSizeScaleY).bottomSpaceToView(self, 22*autoSizeScaleY).widthIs(56*autoSizeScaleX);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(_icon, 20*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(200);
        
        _time=[[UILabel alloc]init];
        _time.textAlignment=NSTextAlignmentRight;
        _time.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _time.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [self addSubview:_time];
        _time.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topEqualToView(_name).bottomEqualToView(_name).widthIs(200);
        
        UILabel *lines=[[UILabel alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:lines];
        lines.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(0.6);
        
    }
    return self;
}
-(void)setModel:(ProductEvaluationResultList *)model{
    NSString *levelStr;
    if (model.baseGrade==0) {
        levelStr=Localized(@"注册会员");
        _icon.image=[UIImage imageNamed:@"icon_register1"];
    }else if (model.baseGrade==1){
        levelStr=Localized(@"铜牌会员");
        _icon.image=[UIImage imageNamed:@"icon_copper1"];
    }else if (model.baseGrade==2){
        levelStr=Localized(@"银牌会员");
        _icon.image=[UIImage imageNamed:@"icon_silver1"];
    }else if (model.baseGrade==3){
        levelStr=Localized(@"金牌会员");
        _icon.image=[UIImage imageNamed:@"icon_gold1"];
    }else if (model.baseGrade==4){
        levelStr=Localized(@"钻石会员");
        _icon.image=[UIImage imageNamed:@"icon_diamond1"];
    }
    _name.text=levelStr;
    _time.text=model.commentReplyTime;



}
@end
