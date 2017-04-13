//
//  MyButtonCell.m
//  GFreemall
//
//  Created by 123 on 2017/4/12.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyButtonCell.h"

@implementation MyButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        _btn=[[MyButton alloc]init];
        [_btn setTitle:Localized(@"确定") forState:UIControlStateNormal];
        [_btn setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _btn.backgroundColor=[TheParentClass colorWithHexString:@"#292929"];
        _btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _btn.layer.cornerRadius = 6*autoSizeScaleX;
        _btn.layer.masksToBounds = 6*autoSizeScaleX;
        [self.contentView addSubview:_btn];
        _btn.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 20*autoSizeScaleY).topSpaceToView(self.contentView, 20*autoSizeScaleY);
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
