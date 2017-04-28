//
//  EvaluationOfTheHeadView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "EvaluationOfTheHeadView.h"

@implementation EvaluationOfTheHeadView

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
        autoSize
      
        //评论数
        _nameNumber=[[UILabel alloc]init];
        _nameNumber.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _nameNumber.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self addSubview:_nameNumber];
  
      
        _nameNumber.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0);
        //箭头
        _icon=[[MyButton alloc]init];
        [_icon setImage:[UIImage imageNamed:@"icon_right-"] forState:UIControlStateNormal];
        [self addSubview:_icon];
        _icon.sd_layout.rightSpaceToView(self, 15*autoSizeScaleX).topSpaceToView(self, 18*autoSizeScaleY).bottomSpaceToView(self, 18*autoSizeScaleY).widthIs(44*autoSizeScaleX);
        
        //百分比
        _percentageNumber=[[MyButton alloc]init];
        [_percentageNumber setTitleColor:[TheParentClass colorWithHexString:@"#de0024"] forState:UIControlStateNormal];
        _percentageNumber.titleLabel.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self addSubview:_percentageNumber];
        _percentageNumber.sd_layout.rightSpaceToView(self, 60*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(40);
        
        
        UILabel *string=[[UILabel alloc]init];
        string.text=Localized(@"好评度");
        string.textColor=[TheParentClass colorWithHexString:@"#292929"];
        string.textAlignment=NSTextAlignmentRight;
        string.font=[UIFont systemFontOfSize:26*autoSizeScaleX];
        [self addSubview:string];
        string.sd_layout.rightSpaceToView(_percentageNumber, 10*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(100*autoSizeScaleX);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"d7d7d7"];
        [self addSubview:line];
        line.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0).heightIs(0.6);
        
        
        
    }
    return self;
}
-(void)setModel:(GoodsDetailsBaseClass *)model{
    autoSize
    self.backgroundColor=[UIColor whiteColor];
    float a=model.totalCount-model.badCount;
    float b=a/model.totalCount;
    if (model.totalCount>0) {
       _nameNumber.text=[NSString stringWithFormat:@"评论数:%.0f",model.totalCount];
    }else{
    _nameNumber.text=[NSString stringWithFormat:@"评论数:0"];
    }
    
    CGSize size=[TheParentClass  StringHeight:_nameNumber.text Lblfont:26*autoSizeScaleY heightOfTheMinus:0];
    _nameNumber.sd_layout.widthIs(size.width);
    [_percentageNumber setTitle:[NSString stringWithFormat:@"%.0f%%",b] forState:UIControlStateNormal];

}
@end
