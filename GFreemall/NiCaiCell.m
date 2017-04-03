//
//  NiCaiCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "NiCaiCell.h"

@implementation NiCaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        
        _swc=[[UISwitch alloc]init];
        _swc.on = NO;//设置初始为ON的一边
        [self.contentView addSubview:_swc];
        _swc.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 20*autoSizeScaleY).topSpaceToView(self.contentView, 20*autoSizeScaleY).widthIs(110*autoSizeScaleX);

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
