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
        
        _line=[[UILabel alloc]init];
        _line.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        [self addSubview:_line];
        _line.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(20*autoSizeScaleY);
        
        _btnOne=[[MyButton alloc]init];
        _btnOne.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
       // [_PaymentAndDeleteBtn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
        [_btnOne.layer setBorderWidth:1];
        _btnOne.tag=1;
        [_btnOne.layer setMasksToBounds:YES];
        _btnOne.layer.cornerRadius = 4*autoSizeScaleX;
        _btnOne.layer.masksToBounds = 4*autoSizeScaleX;
        [self addSubview:_btnOne];
        
        _BtnTwo=[[MyButton alloc]init];
        [_BtnTwo.layer setBorderWidth:1];
        _BtnTwo.tag=2;
        [_BtnTwo.layer setMasksToBounds:YES];
        _BtnTwo.layer.cornerRadius = 4*autoSizeScaleX;
        _BtnTwo.layer.masksToBounds = 4*autoSizeScaleX;
        _BtnTwo.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [self addSubview:_BtnTwo];        

        
        _messageString=[[UILabel alloc]init];
        _messageString.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _messageString.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _messageString.textAlignment=NSTextAlignmentRight;
        [self addSubview:_messageString];
        

        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:line];
        line.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(_line, 0).heightIs(0.5);
        
        
    }
    return self;
    
}

-(void)setList:(OrderListResultList *)list{
    autoSize
    
    
    if (list.orderState==0) {//未付款
        [_btnOne setTitle:@"去支付" forState:UIControlStateNormal];
        _btnOne.string=@"待付款";
        [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#de0024"].CGColor];
        _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"de0024"] forState:UIControlStateNormal];
        
        
        
        _BtnTwo.string=@"取消订单";
        [_BtnTwo setTitle:@"取消订单" forState:UIControlStateNormal];
        [_BtnTwo.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
        _BtnTwo.sd_layout.rightSpaceToView(_btnOne, 20*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_BtnTwo setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateNormal];

    }else if (list.orderState==1){//已付款未发货
        _messageString.text=@"请等待...";
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
        
    }else if (list.orderState==2){//已发货
        
        [_btnOne setTitle:@"确认收货" forState:UIControlStateNormal];
        _btnOne.string=@"确认收货";
        [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#71b247"].CGColor];
        _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"71b247"] forState:UIControlStateNormal];

        
    }else if (list.orderState==3){//已收货未评价
        [_btnOne setTitle:@"去评价" forState:UIControlStateNormal];
        _btnOne.string=@"去评价";
        [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#e6671a"].CGColor];
        _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"#e6671a"] forState:UIControlStateNormal];
    }else if (list.orderState==4){//已收货已评价
        _messageString.text=@"已完成";
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adb0ae"];
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
    }else if (list.orderState==-1){//撤销
        _messageString.text=@"已取消";
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adb0ae"];
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
    }else if (list.orderState==-2){//平台撤销
        _messageString.text=@"已撤销";
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adb0ae"];
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
    }else if (list.orderState==-3){//有退货
        
    }

}
-(void)setMap:(OrderDetailsMap *)map{
    autoSize
    
    
    if (map.orderState==0) {//未付款
        [_btnOne setTitle:@"去支付" forState:UIControlStateNormal];
        _btnOne.string=@"待付款";
        [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#de0024"].CGColor];
        _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"de0024"] forState:UIControlStateNormal];
        
        
        
        _BtnTwo.string=@"取消订单";
        [_BtnTwo setTitle:@"取消订单" forState:UIControlStateNormal];
        [_BtnTwo.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
        _BtnTwo.sd_layout.rightSpaceToView(_btnOne, 20*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_BtnTwo setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateNormal];
        
    }else if (map.orderState==1){//已付款未发货
        _messageString.text=@"请等待...";
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(200);
        
    }else if (map.orderState==2){//已发货
        
        [_btnOne setTitle:@"确认收货" forState:UIControlStateNormal];
        _btnOne.string=@"确认收货";
        [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#71b247"].CGColor];
        _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"71b247"] forState:UIControlStateNormal];
        
        
    }else if (map.orderState==3){//已收货未评价
        [_btnOne setTitle:@"去评价" forState:UIControlStateNormal];
        _btnOne.string=@"去评价";
        [_btnOne.layer setBorderColor:[TheParentClass colorWithHexString:@"#e6671a"].CGColor];
        _btnOne.sd_layout.rightSpaceToView(self, 25*autoSizeScaleY).topSpaceToView(self, 14*autoSizeScaleY).bottomSpaceToView(_line, 14*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        [_btnOne setTitleColor:[TheParentClass colorWithHexString:@"#e6671a"] forState:UIControlStateNormal];
    }else if (map.orderState==4){//已收货已评价
        _messageString.text=@"已完成";
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adb0ae"];
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
    }else if (map.orderState==-1){//撤销
        _messageString.text=@"已取消";
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adb0ae"];
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
    }else if (map.orderState==-2){//平台撤销
        _messageString.text=@"已撤销";
        _messageString.textColor=[TheParentClass colorWithHexString:@"#adb0ae"];
        _messageString.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 20*autoSizeScaleY).widthIs(200);
    }else if (map.orderPayState==-3){//有退货
        
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
