//
//  ClearingInformationDisplayCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ClearingInformationDisplayCell.h"

@implementation ClearingInformationDisplayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        
        _icon=[[UIImageView alloc]init];
        [self.contentView addSubview:_icon];
        _icon.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).bottomSpaceToView(self.contentView, 20*autoSizeScaleY).widthIs(70*autoSizeScaleY);
        
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(_icon, 28*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(400*autoSizeScaleX);
        
        _go=[[UIImageView alloc]init];
        [self.contentView addSubview:_go];
        _go.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 33*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
        _lines=[[UILabel alloc]init];
        [self.contentView addSubview:_lines];
        _lines.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
        
    }
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
