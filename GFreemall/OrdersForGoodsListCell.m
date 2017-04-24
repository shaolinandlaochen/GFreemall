//
//  OrdersForGoodsListCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrdersForGoodsListCell.h"

@implementation OrdersForGoodsListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        
        for (int i=0; i<3; i++) {
            UIImageView *img=[[UIImageView alloc]init];
            [self.contentView addSubview:img];
            float x=25+(124+20)*(i%3);
            img.tag=i+1;
            img.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 26*autoSizeScaleY).widthIs(124*autoSizeScaleX).heightIs(124*autoSizeScaleY);
            
        }
        
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#000000"];
        _number.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        
        _number.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_number];
        _number.sd_layout.rightSpaceToView(self.contentView, 85*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(100*autoSizeScaleX);
        UIImageView *go=[[UIImageView alloc]init];
        go.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:go];
        go.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 66*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
        
    }
    return self;

}
-(void)setDic:(NSDictionary *)dic{
    ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:dic];
    
    _number.text=[NSString stringWithFormat:@"共%ld件",class.list.count];
    for (int i=0; i<class.list.count; i++) {
        if (i<3) {
            
            ShoppingSettlementList *list=class.list[i];
            NSLog(@"%@",[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.attr.commodityImagesPath,list.attr.commodityImages]);
            [((UIImageView *)[self.contentView viewWithTag:i+1]) sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.attr.commodityImagesPath,list.attr.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
            NSLog(@"/////////%@",[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.attr.commodityImagesPath,list.attr.commodityCoverImage]);
        }
        
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
