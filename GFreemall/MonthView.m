//
//  MonthView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MonthView.h"

@implementation MonthView

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
        self.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        _MonthTitle=[[UILabel  alloc]init];
        _MonthTitle.textColor=[TheParentClass colorWithHexString:@"#373f4e"];
        _MonthTitle.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self addSubview:_MonthTitle];
        _MonthTitle.sd_layout.leftSpaceToView(self, 42*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(300*autoSizeScaleX);
        
        
        _btn=[[MyButton alloc]init];
        [_btn setImage:[UIImage imageNamed:@"icon_calendar"] forState:UIControlStateNormal];
        [self addSubview:_btn];
        _btn.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 17*autoSizeScaleY).bottomSpaceToView(self, 17*autoSizeScaleY).widthIs(66*autoSizeScaleX);
        
        
    }
    return self;

}
@end
