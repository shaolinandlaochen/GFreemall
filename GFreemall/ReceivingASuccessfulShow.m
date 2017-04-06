//
//  ReceivingASuccessfulShow.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ReceivingASuccessfulShow.h"

@implementation ReceivingASuccessfulShow

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
        _img=[[UIImageView alloc]init];
        [self addSubview:_img];
        _img.sd_layout.leftSpaceToView(self, 325*autoSizeScaleX).topSpaceToView(self, 140*autoSizeScaleY).rightSpaceToView(self, 325*autoSizeScaleX).bottomSpaceToView(self, 140*autoSizeScaleY);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _name.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(self, 0).topSpaceToView(_img, 26*autoSizeScaleY).rightSpaceToView(self, 0).heightIs(35*autoSizeScaleY);
        UILabel *lbl=[[UILabel alloc]init];
        lbl.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0).heightIs(0.6);
        
    }
    return self;
}
@end
