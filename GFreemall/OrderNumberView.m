//
//  OrderNumberView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderNumberView.h"

@implementation OrderNumberView
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        autoSize
        _strNumber=[[UILabel alloc]init];
        _strNumber.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _strNumber.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self addSubview:_strNumber];
        _strNumber.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(500*autoSizeScaleX);
        
        
        _state=[[UILabel alloc]init];
        _state.textAlignment=NSTextAlignmentRight;
        _state.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [self addSubview:_state];
        _state.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(150*autoSizeScaleX);
        
    }
    return self;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
