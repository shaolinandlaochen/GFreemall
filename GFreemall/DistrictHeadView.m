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
        _name.text=@"我是小明";
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [self addSubview:_name];
        CGSize size=[TheParentClass StringHeight:_name.text Lblfont:24*autoSizeScaleY heightOfTheMinus:0];
        _name.sd_layout.leftSpaceToView(_icon, 20*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(size.width);
        
        _time=[[UILabel alloc]init];
        _time.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _time.text=@"2016-01-01";
        _time.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [self addSubview:_time];
        CGSize timesize=[TheParentClass StringHeight:_time.text Lblfont:24*autoSizeScaleY heightOfTheMinus:0];
        _time.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topEqualToView(_name).bottomEqualToView(_name).widthIs(timesize.width);
        
        UILabel *lines=[[UILabel alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:lines];
        lines.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(0.6);
        
    }
    return self;
}
@end
