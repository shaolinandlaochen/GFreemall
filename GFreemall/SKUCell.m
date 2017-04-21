//
//  SKUCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SKUCell.h"

@implementation SKUCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _lbl=[[UILabel alloc]init];
        _lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _lbl.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self.contentView addSubview:_lbl];
       
        _stringSKU=[[UILabel alloc]init];
        _stringSKU.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _stringSKU.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self.contentView addSubview:_stringSKU];
        _stringSKU.sd_layout.leftSpaceToView(_lbl, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 80*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
        
        UIImageView *icon=[[UIImageView alloc]init];
        icon.image=[UIImage imageNamed:@"icon_more"];
        [self.contentView addSubview:icon];
        icon.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 35*autoSizeScaleY).bottomSpaceToView(self.contentView, 35*autoSizeScaleY).widthIs(44*autoSizeScaleX);
        
        
        
    }
    return self;

}
-(void)setString:(NSString *)string{
    autoSize
    _lbl.text=string;
    CGSize size=[TheParentClass StringHeight:_lbl.text Lblfont:26*autoSizeScaleY heightOfTheMinus:0];
    _lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(size.width);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
