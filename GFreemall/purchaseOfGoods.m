//
//  purchaseOfGoods.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "purchaseOfGoods.h"

@implementation purchaseOfGoods

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
        NSArray *nameArray=@[@"客服",@"收藏",@"购物车"];
        NSArray *imgArray=@[@"icon_service",@"icon_collect1",@"icon_cart_gray"];
        for (int i=0; i<3; i++) {
            UILabel *lbl=[[UILabel alloc]init];
            lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
            lbl.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
            lbl.textAlignment=NSTextAlignmentCenter;
            lbl.text=Localized(nameArray[i]);
            [self addSubview:lbl];
            CGSize size=[TheParentClass StringHeight:nameArray[i] Lblfont:20*autoSizeScaleY heightOfTheMinus:0];
            lbl.sd_layout.leftSpaceToView(self, (i*104)*autoSizeScaleY).bottomSpaceToView(self, 10*autoSizeScaleY).widthIs(104*autoSizeScaleX).heightIs(size.height);
            
            UIImageView *img=[[UIImageView alloc]init];
            img.tag=100+i;
            img.image=[UIImage imageNamed:imgArray[i]];
            [self addSubview:img];
            float x=34+(36+68)*(i%3);
            img.sd_layout.leftSpaceToView(self, x*autoSizeScaleX).topSpaceToView(self, 16*autoSizeScaleY).widthIs(36*autoSizeScaleX).heightIs(36*autoSizeScaleY);
            
            
           
            
            
            if (i>0) {
                UILabel *lblLines=[[UILabel alloc]init];
                lblLines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
                [self addSubview:lblLines];
                if (i==1) {
                    
                    lblLines.sd_layout.leftSpaceToView(self, 104*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(0.5);
                }else{
                lblLines.sd_layout.leftSpaceToView(self, 208*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(0.5);
                }
            }
            
        }
        //客服
        _CustomerService=[[MyButton alloc]init];
        [self addSubview:_CustomerService];
        _CustomerService.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(104*autoSizeScaleX);
        //收藏
        _collection=[[MyButton alloc]init];
        [self addSubview:_collection];
        _collection.sd_layout.leftSpaceToView(_CustomerService, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(104*autoSizeScaleX);
        //购物车
        _shoppingCar=[[MyButton alloc]init];
        [self addSubview:_shoppingCar];
        _shoppingCar.sd_layout.leftSpaceToView(_collection, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(104*autoSizeScaleX);
        //加入购物车
        _addShoppingCar=[[MyButton alloc]init];
        _addShoppingCar.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
        [_addShoppingCar setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _addShoppingCar.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_addShoppingCar setTitle:Localized(@"加入购物车") forState:UIControlStateNormal];
        [self addSubview:_addShoppingCar];
        _addShoppingCar.sd_layout.rightSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(220*autoSizeScaleX);
        //立即购买
        _buy=[[MyButton alloc]init];
        _buy.backgroundColor=[UIColor redColor];
        [_buy setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _buy.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_buy setTitle:Localized(@"立即购买") forState:UIControlStateNormal];
        [self addSubview:_buy];
        _buy.sd_layout.rightSpaceToView(_addShoppingCar, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(218*autoSizeScaleX);
        
        
        
        
        
    }
    return self;

}
-(void)setIsCollect:(BOOL)isCollect{
    UIImageView *img=(UIImageView *)[self viewWithTag:101];
    if (isCollect) {
        img.image=[UIImage imageNamed:@"icon_collected"];
    }else{
     img.image=[UIImage imageNamed:@"icon_collect1"];
    }
    _collection.why=isCollect;
}
@end
