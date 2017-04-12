//
//  RollOutTableViewCell.m
//  GFreemall
//
//  Created by 123 on 2017/4/12.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "RollOutTableViewCell.h"

@implementation RollOutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).widthIs(140*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
        
        _tetfield=[[MyTextField alloc]init];
        _tetfield.delegate=self;
        _tetfield.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _tetfield.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_tetfield];
        _tetfield.sd_layout.leftSpaceToView(self.contentView, 160*autoSizeScaleX).rightSpaceToView(self.contentView, 180*autoSizeScaleX).bottomSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0);
        
        
        _CodeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_CodeBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        _CodeBtn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [self.contentView addSubview:_CodeBtn];
        _CodeBtn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).widthIs(160*autoSizeScaleX).topSpaceToView(self.contentView, 23*autoSizeScaleY).bottomSpaceToView(self.contentView, 23*autoSizeScaleY);
        
        
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(1);
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
