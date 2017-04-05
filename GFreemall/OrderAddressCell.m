//
//  OrderAddressCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderAddressCell.h"

@implementation OrderAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        _name.text=@"文加班     137542154879";
        [self.contentView addSubview:_name];
        CGSize size=[TheParentClass StringHeight:_name.text Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
        _name.sd_layout.leftSpaceToView(self.contentView, 60*autoSizeScaleX).topSpaceToView(self.contentView, 30*autoSizeScaleY).widthIs(size.width).heightIs(size.height);
        
        _defaultStr=[[UILabel alloc]init];
        _defaultStr.textColor=[TheParentClass colorWithHexString:@"ffffff"];
        _defaultStr.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _defaultStr.textAlignment=NSTextAlignmentCenter;
        _defaultStr.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
        [self.contentView addSubview:_defaultStr];
        _defaultStr.sd_layout.leftSpaceToView(_name, 44*autoSizeScaleX).topSpaceToView(self.contentView, 35*autoSizeScaleY).widthIs(76*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@""];
        [self.contentView addSubview:img];
        img.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_name, 25*autoSizeScaleY).widthIs(26*autoSizeScaleX).widthIs(32*autoSizeScaleY);
        
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
