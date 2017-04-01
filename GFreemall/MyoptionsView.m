//
//  MyoptionsView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyoptionsView.h"

@implementation MyoptionsView

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
        NSArray *nameArray=@[@"商品",@"详情",@"评价"];
      
        for (int i=0; i<3; i++) {
            float x=135+(80+32)*(i%3);
            MyButton *btn=[[MyButton alloc]init];
            btn.tag=i+1;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            if (i==0) {
                btn.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleX];
            }else{
                btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleX];
            }
            [btn setTitle:Localized(nameArray[i]) forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
            btn.sd_layout.leftSpaceToView(self, x*autoSizeScaleX).topSpaceToView(self, 30*autoSizeScaleY).widthIs(80*autoSizeScaleX).heightIs(35*autoSizeScaleY);
           
            UILabel * _line=[[UILabel alloc]init];
            if (i==0) {
                 _line.backgroundColor=[UIColor redColor];
            }else{
             _line.backgroundColor=[UIColor clearColor];
            }
            
            _line.tag=i+5;
            [self addSubview:_line];
            _line.sd_layout.leftSpaceToView(self, x*autoSizeScaleX).bottomSpaceToView(self, 0).widthIs(80*autoSizeScaleX).heightIs(2);
            
        }
    }
    return self;
}
-(void)onButtonClick:(MyButton *)btn{
    autoSize
    [_delegate ProductScreening:btn];
    
    for (int i=0; i<3; i++) {
        MyButton *button=(MyButton *)[self viewWithTag:i+1];
        button.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleX];
        
        UILabel *lbl=(UILabel *)[self viewWithTag:i+5];
        if (btn.tag==i+1) {
            lbl.backgroundColor=[UIColor redColor];
        }else{
            lbl.backgroundColor=[UIColor clearColor];
        }
    }
    btn.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleX];
    
   
}
-(void)setScrollPage:(NSInteger)ScrollPage{
    autoSize
    for (int i=0; i<3; i++) {
        MyButton *button=(MyButton *)[self viewWithTag:i+1];
        button.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleX];
        
        UILabel *lbl=(UILabel *)[self viewWithTag:i+5];
        if (ScrollPage==i) {
            lbl.backgroundColor=[UIColor redColor];
            button.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleX];
        }else{
            lbl.backgroundColor=[UIColor clearColor];
        }
    }
   

}
@end
