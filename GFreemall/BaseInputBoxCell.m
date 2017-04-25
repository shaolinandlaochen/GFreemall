//
//  BaseInputBoxCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "BaseInputBoxCell.h"

@implementation BaseInputBoxCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _tf=[[MyTextField alloc]init];
        _tf.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _tf.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _tf.delegate=self;
        [self.contentView addSubview:_tf];
        _tf.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleY).bottomSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).widthIs(500*autoSizeScaleX);
        
        _btn =[[MyButton alloc]init];
        [_btn.layer setBorderWidth:1];
        _btn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_btn.layer setMasksToBounds:YES];
        _btn.layer.cornerRadius = 6*autoSizeScaleX;
        _btn.layer.masksToBounds = 6*autoSizeScaleX;
        [_btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn];
        _btn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).bottomSpaceToView(self.contentView, 20*autoSizeScaleY).widthIs(160*autoSizeScaleX);
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
        
    }
    return self;

}
- (void)textFieldDidEndEditing:(MyTextField *)textField{

    [_delegate ToObtainInputBox:textField];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
