//
//  ShoppingCarViews.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShoppingCarViews.h"

@implementation ShoppingCarViews

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        autoSize
        //选中按钮
        self.backgroundColor=[UIColor whiteColor];
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
        [self addSubview:line];
        line.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(0.6);
        _selectedBtn=[[MyButton alloc]init];
        [_selectedBtn setImage:[UIImage imageNamed:@"icon_circle"] forState:UIControlStateNormal];
        [self addSubview:_selectedBtn];
        _selectedBtn.sd_layout.leftSpaceToView(self, 10*autoSizeScaleX).topSpaceToView(self, 20*autoSizeScaleY).widthIs(60*autoSizeScaleX).heightIs(60*autoSizeScaleY);
        UILabel *lbl=[[UILabel alloc]init];
        lbl.text=Localized(@"全选");
        lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
        lbl.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [self addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(_selectedBtn, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(65*autoSizeScaleY);
        _picle=[[UILabel alloc]init];
        _picle.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _picle.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self addSubview:_picle];
        _picle.sd_layout.leftSpaceToView(lbl,25*autoSizeScaleX).topEqualToView(lbl).bottomEqualToView(lbl).widthIs(300*autoSizeScaleX);
        
        _PaymentAndDeleteBtn=[[MyButton alloc]init];
        _PaymentAndDeleteBtn.why=YES;
        _PaymentAndDeleteBtn.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
        [_PaymentAndDeleteBtn setTitle:Localized(@"去支付") forState:UIControlStateNormal];
        [_PaymentAndDeleteBtn setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _PaymentAndDeleteBtn.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
        [self addSubview:_PaymentAndDeleteBtn];
        _PaymentAndDeleteBtn.sd_layout.rightSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(240*autoSizeScaleX);
        
  
        
    }
    return self;
}
-(void)setState:(BOOL)state{
autoSize
    _PaymentAndDeleteBtn.why=state;
    if (state) {
        _PaymentAndDeleteBtn.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
        [_PaymentAndDeleteBtn setTitle:Localized(@"去支付") forState:UIControlStateNormal];
        [_PaymentAndDeleteBtn setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _PaymentAndDeleteBtn.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
    }else{
        [_PaymentAndDeleteBtn setTitle:Localized(@"删除") forState:UIControlStateNormal];
        _PaymentAndDeleteBtn.backgroundColor=[UIColor whiteColor];
        [_PaymentAndDeleteBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        _PaymentAndDeleteBtn.titleLabel.font=[UIFont systemFontOfSize:29*autoSizeScaleX];
        [_PaymentAndDeleteBtn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
        [_PaymentAndDeleteBtn.layer setBorderWidth:1];
        [_PaymentAndDeleteBtn.layer setMasksToBounds:YES];
        _PaymentAndDeleteBtn.layer.cornerRadius = 6*autoSizeScaleX;
        _PaymentAndDeleteBtn.layer.masksToBounds = 6*autoSizeScaleX;
        _PaymentAndDeleteBtn.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 19*autoSizeScaleY).bottomSpaceToView(self, 19*autoSizeScaleY).widthIs(142*autoSizeScaleX);
        
    }

}
@end
