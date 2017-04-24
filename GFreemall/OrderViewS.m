//
//  OrderViewS.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderViewS.h"

@implementation OrderViewS

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
        
        UILabel *lines=[[UILabel alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:lines];
        lines.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0).heightIs(0.6);
        NSArray *nameArray=@[@"全部",@"待付款",@"待收货",@"待评价"];
        for (int i=0; i<4; i++) {
            MyButton *btn=[[MyButton alloc]init];
            [btn setTitle:Localized(nameArray[i]) forState:UIControlStateNormal];
            [btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
             [btn setTitleColor:[TheParentClass colorWithHexString:@"#de0024"] forState:UIControlStateSelected];
            btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];

            btn.tag=i+1;
            [btn addTarget:self action:@selector(onButtonCLick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            float x=750/4;
            btn.sd_layout.leftSpaceToView(self, x*i*autoSizeScaleX).topSpaceToView(self, 0).widthIs(x*autoSizeScaleX).bottomSpaceToView(self, 0);
            
            
            UILabel *lin=[[UILabel alloc]init];
            lin.backgroundColor=[UIColor clearColor];
            lin.tag=i+10;
            [self addSubview:lin];
            float xxx=50+(90+96)*(i%4);

            lin.sd_layout.leftSpaceToView(self, xxx*autoSizeScaleX).bottomSpaceToView(self, 0).widthIs(90*autoSizeScaleX).heightIs(2);
            
        }
        
        
        
    }
    return self;

}
-(void)onButtonCLick:(MyButton *)btn{
    for (int i=0; i<4; i++) {
        MyButton *buttong=(MyButton *)[self viewWithTag:i+1];
        buttong.selected=NO;
        UILabel *line=(UILabel *)[self viewWithTag:i+10];
        line.backgroundColor=[UIColor clearColor];
        
    }
    btn.selected=YES;
    UILabel *lines=(UILabel *)[self viewWithTag:btn.tag+9];
    lines.backgroundColor=[UIColor redColor];
    [_delegate OrderTypeSwitch:btn.tag];


}
-(void)setType:(NSInteger)type{
    for (int i=0; i<4; i++) {
        MyButton *buttong=(MyButton *)[self viewWithTag:i+1];
        buttong.selected=NO;
        UILabel *line=(UILabel *)[self viewWithTag:i+10];
        line.backgroundColor=[UIColor clearColor];
        if (i==type) {
                buttong.selected=YES;
            UILabel *lines=(UILabel *)[self viewWithTag:i+10];
            lines.backgroundColor=[UIColor redColor];
        }
        
    }



}
@end
