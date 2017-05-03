//
//  AllEvaluationView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AllEvaluationView.h"

@implementation AllEvaluationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        autoSize
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:line];
        //line.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(0.5);
        
        
        _button=[[MyButton alloc]init];
        _button.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_button setTitleColor:[TheParentClass colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        _button.backgroundColor=[UIColor whiteColor];
        [_button.layer setBorderColor:[TheParentClass colorWithHexString:@"#b2b2b2"].CGColor];
        [_button.layer setBorderWidth:0.6];
        [_button.layer setMasksToBounds:YES];
        _button.layer.cornerRadius = 6*autoSizeScaleX;
        _button.layer.masksToBounds = 6*autoSizeScaleX;
        [self addSubview:_button];
        _button.sd_layout.leftSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 20*autoSizeScaleY).rightSpaceToView(self, 25*autoSizeScaleX).bottomSpaceToView(self, 20*autoSizeScaleY);
        
    }
    return self;

}
@end
