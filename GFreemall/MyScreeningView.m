//
//  MyScreeningView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyScreeningView.h"

@implementation MyScreeningView

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
        float width=750/4;
        NSArray *nameArray=@[@"全部评价",@"好评",@"中评",@"差评"];
        for (int i=0; i<4; i++) {
            UILabel *lbl=[[UILabel alloc]init];
            lbl.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
            if (i==0) {
                lbl.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            }else{
                lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
            }
            lbl.text=Localized(nameArray[i]);
            lbl.tag=i+1;
            lbl.textAlignment=NSTextAlignmentCenter;
            [self addSubview:lbl];
            lbl.sd_layout.leftSpaceToView(self, width*autoSizeScaleX*i).topSpaceToView(self, 10*autoSizeScaleY).widthIs(width*autoSizeScaleX).heightIs(30*autoSizeScaleY);
    
          
            
            UILabel *number=[[UILabel alloc]init];
            number.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
            if (i==0) {
                number.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            }else{
                number.textColor=[TheParentClass colorWithHexString:@"#292929"];
            }
           // number.text=@"999";
            number.textAlignment=NSTextAlignmentCenter;
            number.tag=i+10;
            [self addSubview:number];
            number.sd_layout.leftSpaceToView(self, width*i*autoSizeScaleX).topSpaceToView(self, 50*autoSizeScaleY).heightIs(30*autoSizeScaleY).widthIs(width*autoSizeScaleX);
            
            
            MyButton *btn=[[MyButton alloc]init];
            btn.index=i;
            [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            btn.sd_layout.leftSpaceToView(self, i*width*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(width*autoSizeScaleX);
            
            
        }
        
        UILabel *lines=[[UILabel alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        [self addSubview:lines];
        lines.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(20*autoSizeScaleY);
        
    }
    return self;
}


-(void)onButtonClick:(MyButton *)btn{

    for (int i=0; i<4; i++) {
        UILabel *lbl=(UILabel *)[self viewWithTag:i+1];
        UILabel *number=(UILabel *)[self viewWithTag:i+10];
        if (i==btn.index) {
            lbl.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            number.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        }else{
            lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
            number.textColor=[TheParentClass colorWithHexString:@"#292929"];
        }
        
        
    }
    [_delegate index:btn.index];
    
}
-(void)setModel:(ProductEvaluationBaseClass *)model{
    ((UILabel *)[self viewWithTag:10]).text=[NSString stringWithFormat:@"%.0f",model.totalCount];
    ((UILabel *)[self viewWithTag:11]).text=[NSString stringWithFormat:@"%.0f",model.goodCount];
    ((UILabel *)[self viewWithTag:12]).text=[NSString stringWithFormat:@"%.0f",model.commonlyCount];
    ((UILabel *)[self viewWithTag:13]).text=[NSString stringWithFormat:@"%.0f",model.badCount];


}
@end
