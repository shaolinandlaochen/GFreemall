//
//  OrderButtonView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderButtonView.h"

@implementation OrderButtonView

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        autoSize
        
        _btnOne=[[MyButton alloc]init];
        _btnOne.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
       // [_PaymentAndDeleteBtn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
        [_btnOne.layer setBorderWidth:1];
        [_btnOne.layer setMasksToBounds:YES];
        _btnOne.layer.cornerRadius = 4*autoSizeScaleX;
        _btnOne.layer.masksToBounds = 4*autoSizeScaleX;
        [self addSubview:_btnOne];
        
        _BtnTwo=[[MyButton alloc]init];
        [_BtnTwo.layer setBorderWidth:1];
        [_BtnTwo.layer setMasksToBounds:YES];
        _BtnTwo.layer.cornerRadius = 4*autoSizeScaleX;
        _BtnTwo.layer.masksToBounds = 4*autoSizeScaleX;
        _BtnTwo.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [self addSubview:_BtnTwo];
        

        
        _messageString=[[UILabel alloc]init];
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adboae"];
        _messageString.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _messageString.textAlignment=NSTextAlignmentRight;
        [self addSubview:_messageString];
        

        
        _line=[[UILabel alloc]init];
        _line.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        [self addSubview:_line];
        _line.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(20*autoSizeScaleY);
    }
    return self;
    
}
-(void)setStrOne:(NSString *)strOne{
    autoSize
    [_btnOne setTitle:strOne forState:UIControlStateNormal];
    _btnOne.string=strOne;
     [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#de0024"].CGColor];
    _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
    [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"de0024"] forState:UIControlStateNormal];

}
-(void)setStrTwo:(NSString *)strTwo{

    autoSize
    _BtnTwo.string=strTwo;
    [_BtnTwo setTitle:strTwo forState:UIControlStateNormal];
    [_BtnTwo.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
    _BtnTwo.sd_layout.rightSpaceToView(_btnOne, 20*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
    [_BtnTwo setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateNormal];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
