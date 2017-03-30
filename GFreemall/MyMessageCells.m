//
//  MyMessageCells.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyMessageCells.h"

@implementation MyMessageCells

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _icon=[[UIImageView alloc]init];
        [self.contentView addSubview:_icon];
        _icon.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 21*autoSizeScaleY).widthIs(48*autoSizeScaleX).heightIs(48*autoSizeScaleY);
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:32*autoSizeScaleX];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(_icon, 24*autoSizeScaleX).topEqualToView(_icon).widthIs(200).heightIs(48*autoSizeScaleY);
        //小箭头
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:img];
        img.sd_layout.rightSpaceToView(self.contentView, 8*autoSizeScaleX).topSpaceToView(self.contentView, 23*autoSizeScaleY).widthIs(44*autoSizeScaleX);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
