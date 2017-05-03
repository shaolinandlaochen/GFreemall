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
        
        
        _CHOOSE=[[MyButton alloc]init];
        [_CHOOSE setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateNormal];
        _CHOOSE.titleLabel.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self.contentView addSubview:_CHOOSE];

        _CHOOSE.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(0);
        
        
        _imgTopBo=[[UIImageView alloc]init];
        [self.contentView addSubview:_imgTopBo];
        _imgTopBo.sd_layout.leftSpaceToView(_CHOOSE, 2).topSpaceToView(self.contentView, 37*autoSizeScaleY).widthIs(0*autoSizeScaleX).heightIs(22*autoSizeScaleY);


        
        
        _tf=[[MyTextField alloc]init];
        _tf.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _tf.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _tf.delegate=self;
        [_tf addTarget:self action:@selector(textChange:) forControlEvents:
         UIControlEventEditingChanged];
        [self.contentView addSubview:_tf];
        _tf.sd_layout.leftSpaceToView(_imgTopBo, 10*autoSizeScaleY).bottomSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0);
        
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
-(void)setStringBtnTitle:(NSString *)stringBtnTitle{
autoSize
    
    
    CGSize size=[TheParentClass StringHeight:stringBtnTitle Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
    [_CHOOSE setTitle:stringBtnTitle forState:UIControlStateNormal];
   _CHOOSE.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(size.width);
    _imgTopBo.sd_layout.leftSpaceToView(_CHOOSE, 2).topSpaceToView(self.contentView, 37*autoSizeScaleY).widthIs(17*autoSizeScaleX).heightIs(22*autoSizeScaleY);
    _imgTopBo.image=[UIImage imageNamed:@"icon_select_country"];


}
-(void)textChange:(MyTextField *)TextField{
     [_delegate ToObtainInputBox:TextField];

}
-(void)MailNextViewButtonTitleString:(NSString *)name{
 [_btn setTitle:name forState:UIControlStateNormal];
}
-(void)ButtonTitleString:(NSString *)name{
    [_btn setTitle:name forState:UIControlStateNormal];

}
- (void)textFieldDidEndEditing:(MyTextField *)textField{

    [_delegate ToObtainInputBox:textField];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
