//
//  OrderCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _icon=[[MyButton alloc]init];
        [self.contentView addSubview:_icon];
        _icon.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 12*autoSizeScaleY).bottomSpaceToView(self.contentView, 12*autoSizeScaleY).widthIs(152*autoSizeScaleX);
        
        
        _name=[[UILabel alloc]init];
        _name.numberOfLines=2;
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:28*autoSizeScaleX];
        [self.contentView addSubview:_name];
       
        
        _text=[[UILabel alloc]init];
        _text.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _text.font=[UIFont systemFontOfSize:24*autoSizeScaleX];
        [self.contentView addSubview:_text];
     
        
        //价格
        _picre=[[UILabel alloc]init];
        _picre.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _picre.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self.contentView addSubview:_picre];
        
        
        _freight=[[UILabel alloc]init];
        _freight.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _freight.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [self.contentView addSubview:_freight];
        
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _number.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _number.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_number];
        
    
        
        
        
    }
    return self;

}
-(void)setCommodity:(OrderListCommodity *)Commodity{
autoSize
    
      _name.text=Commodity.commodityName;
    
   
    
    CGSize size=[TheParentClass StringHeight:_name.text Lblfont:28*autoSizeScaleY heightOfTheMinus:265*autoSizeScaleX];
    _name.sd_layout.leftSpaceToView(_icon, 18*autoSizeScaleX).topEqualToView(_icon).rightSpaceToView(self.contentView, 70).heightIs(size.height);
     _text.text=Commodity.commodityAttributes;
    _text.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 12*autoSizeScaleY).rightEqualToView(_name).heightIs(30*autoSizeScaleY);

    
    _picre.text=[NSString stringWithFormat:@"¥%.2f",Commodity.commoditySellprice];
    
    CGSize picSize=[TheParentClass StringHeight:_picre.text Lblfont:26*autoSizeScaleY heightOfTheMinus:265*autoSizeScaleX];
    _picre.sd_layout.leftEqualToView(_name).bottomSpaceToView(self.contentView, 12*autoSizeScaleY).widthIs(picSize.width).heightIs(35*autoSizeScaleY);
    
    if (Commodity.commodityFreight>0) {
        _freight.text=[NSString stringWithFormat:@"(含运费:%.2f元)",Commodity.commodityFreight];
        _freight.sd_layout.leftSpaceToView(_picre, 0).topEqualToView(_picre).rightSpaceToView(self.contentView, 70*autoSizeScaleX).heightIs(35*autoSizeScaleY);
    }else{
        _freight.text=@"(免邮费)";
        _freight.sd_layout.leftSpaceToView(_picre, 0).topEqualToView(_picre).rightSpaceToView(self.contentView, 70*autoSizeScaleX).heightIs(35*autoSizeScaleY);
    }

    
    
    _number.text=[NSString stringWithFormat:@"x%.0f",Commodity.commodityQuantity];
    _number.sd_layout.topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 0).widthIs(30);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
