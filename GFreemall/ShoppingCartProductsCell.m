//
//  ShoppingCartProductsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShoppingCartProductsCell.h"

@implementation ShoppingCartProductsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        //选中按钮
        _selectedBtn=[[MyButton alloc]init];
        [_selectedBtn setImage:[UIImage imageNamed:@"icon_circle"] forState:UIControlStateNormal];
        [self.contentView addSubview:_selectedBtn];
        _selectedBtn.sd_layout.leftSpaceToView(self.contentView, 10*autoSizeScaleX).topSpaceToView(self.contentView, 100*autoSizeScaleY).widthIs(60*autoSizeScaleX).heightIs(60*autoSizeScaleY);
        //商品图片
        _icon=[[UIImageView alloc]init];
        [_icon.layer setBorderColor:[TheParentClass colorWithHexString:@"#d7d7d7"].CGColor];
        [_icon.layer setBorderWidth:0.6];
        [_icon.layer setMasksToBounds:YES];
        _icon.layer.cornerRadius = 6*autoSizeScaleX;
        _icon.layer.masksToBounds = 6*autoSizeScaleX;
        [self.contentView addSubview:_icon];
        _icon.sd_layout.leftSpaceToView(self.contentView, 86*autoSizeScaleX).topSpaceToView(self.contentView, 37*autoSizeScaleY).widthIs(186*autoSizeScaleX).heightIs(186*autoSizeScaleY);
        
        //商品名称
        _name=[[UILabel  alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _name.numberOfLines=2;
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(_icon, 25*autoSizeScaleX).topEqualToView(_icon).rightSpaceToView(self.contentView, 86*autoSizeScaleX).autoHeightRatio(0);
        //商品描述
        _describe=[[UILabel alloc]init];
        _describe.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _describe.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _describe.numberOfLines=2;
        [self.contentView addSubview:_describe];
        _describe.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 10*autoSizeScaleY).rightEqualToView(_name).autoHeightRatio(0);
        //价格
        _price=[[UILabel alloc]init];
        _price.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _price.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self.contentView addSubview:_price];
        _price.sd_layout.leftEqualToView(_name).bottomSpaceToView(self.contentView, 42*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        //加减背景
        _bjImage=[[MyImageView alloc]init];
        [self.contentView addSubview:_bjImage];
        _bjImage.sd_layout.bottomSpaceToView(self.contentView, 37*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).widthIs(173*autoSizeScaleX).heightIs(50*autoSizeScaleY);
        
        //数量
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _number.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _number.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_number];
        _number.sd_layout.leftEqualToView(_bjImage).topEqualToView(_bjImage).rightEqualToView(_bjImage).bottomEqualToView(_bjImage);
        //加
        _addBtn=[[MyButton alloc]init];
        _addBtn.why=YES;
        [self.contentView addSubview:_addBtn];
        _addBtn.sd_layout.rightEqualToView(_bjImage).topEqualToView(_bjImage).widthIs(_bjImage.frame.size.width/2).bottomEqualToView(_bjImage);
        //减
        _deleteBtn=[[MyButton alloc]init];
        _deleteBtn.why=NO;
        [self.contentView addSubview:_deleteBtn];
        _deleteBtn.sd_layout.leftEqualToView(_bjImage).topEqualToView(_bjImage).bottomEqualToView(_bjImage).widthIs(_bjImage.frame.size.width/2);
        
        
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
