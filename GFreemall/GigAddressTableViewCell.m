//
//  GigAddressTableViewCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GigAddressTableViewCell.h"

@implementation GigAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize

    
        
        UIImageView *iocn=[[UIImageView alloc]init];
        iocn.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:iocn];
        iocn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 31*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
        
        _address=[[UILabel alloc]init];
        _address.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _address.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _address.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_address];
        _address.sd_layout.rightSpaceToView(iocn, 15*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).leftSpaceToView(self.contentView, 100*autoSizeScaleX);
        
        UILabel *lines=[[UILabel alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:lines];
        lines.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
