//
//  MyView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyView.h"

@implementation MyView

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
        UILabel *lbl=[[UILabel alloc]init];
        lbl.text=Localized(@"新款上市");
        lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleX];
        lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
        [self addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 25*autoSizeScaleY).bottomSpaceToView(self, 25*autoSizeScaleY).rightSpaceToView(self, 25*autoSizeScaleX);
        
        
    }
    return self;
}
@end
