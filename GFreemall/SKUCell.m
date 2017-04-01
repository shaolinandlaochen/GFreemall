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
        UILabel *lbl=[[UILabel alloc]init];
        lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        lbl.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        lbl.text=Localized(@"已选");
        [self.contentView addSubview:lbl];
        CGSize size=[TheParentClass StringHeight:lbl.text Lblfont:26*autoSizeScaleY heightOfTheMinus:0];
        lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(size.width);
        _stringSKU=[[UILabel alloc]init];
        _stringSKU.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _stringSKU.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _stringSKU.text=@"很色,L号,5个";
        [self.contentView addSubview:_stringSKU];
        _stringSKU.sd_layout.leftSpaceToView(lbl, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 80*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
        
        UIImageView *icon=[[UIImageView alloc]init];
        icon.image=[UIImage imageNamed:@"icon_more"];
        [self.contentView addSubview:icon];
        icon.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 35*autoSizeScaleY).bottomSpaceToView(self.contentView, 35*autoSizeScaleY).widthIs(44*autoSizeScaleX);
        
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
