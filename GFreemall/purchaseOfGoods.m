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
        NSArray *nameArray=@[@"收藏",@"购物车"];
        NSArray *imgArray=@[@"icon_collect1",@"icon_cart_gray"];
        for (int i=0; i<2; i++) {
            UILabel *lbl=[[UILabel alloc]init];
            lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
            lbl.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
            lbl.textAlignment=NSTextAlignmentCenter;
            lbl.text=Localized(nameArray[i]);
            [self addSubview:lbl];
            if (i==0) {
                 lbl.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 10*autoSizeScaleY).widthIs(151*autoSizeScaleX).heightIs(30*autoSizeScaleY);
            }else{
             lbl.sd_layout.leftSpaceToView(self, 151*autoSizeScaleX).bottomSpaceToView(self, 10*autoSizeScaleY).widthIs(151*autoSizeScaleX).heightIs(30*autoSizeScaleY);
            }
            
            UIImageView *img=[[UIImageView alloc]init];
            img.tag=100+i;
            img.image=[UIImage imageNamed:imgArray[i]];
            [self addSubview:img];
            if (i==0) {
                  img.sd_layout.leftSpaceToView(self, 57*autoSizeScaleX).topSpaceToView(self, 16*autoSizeScaleY).widthIs(36*autoSizeScaleX).heightIs(36*autoSizeScaleY);
            }else{
            img.sd_layout.leftSpaceToView(self, 208*autoSizeScaleX).topSpaceToView(self, 16*autoSizeScaleY).widthIs(36*autoSizeScaleX).heightIs(36*autoSizeScaleY);
            }
          
            
            
            
        }
        //客服
        _CustomerService=[[MyButton alloc]init];
        //[self addSubview:_CustomerService];
        //_CustomerService.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(104*autoSizeScaleX);
        
        UILabel *lblLines=[[UILabel alloc]init];
        lblLines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:lblLines];
        lblLines.sd_layout.leftSpaceToView(self, 151*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(0.5);
        
        
        
        
        
        
        //收藏
        _collection=[[MyButton alloc]init];
        [self addSubview:_collection];
        _collection.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(151*autoSizeScaleX);
        //购物车
        _shoppingCar=[[MyButton alloc]init];
        [self addSubview:_shoppingCar];
        _shoppingCar.sd_layout.leftSpaceToView(_collection, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(151*autoSizeScaleX);
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
    UIImageView *img=(UIImageView *)[self viewWithTag:100];
    if (isCollect) {
        img.image=[UIImage imageNamed:@"icon_collected"];
    }else{
     img.image=[UIImage imageNamed:@"icon_collect1"];
    }
    _collection.why=isCollect;
}
@end
