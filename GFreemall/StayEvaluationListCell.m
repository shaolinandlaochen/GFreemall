//
//  StayEvaluationListCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "StayEvaluationListCell.h"

@implementation StayEvaluationListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        _img=[[UIImageView alloc]init];
        [_img.layer setBorderColor:[TheParentClass colorWithHexString:@"#d7d7d7"].CGColor];
        [_img.layer setBorderWidth:1];
        [_img.layer setMasksToBounds:YES];
        _img.layer.cornerRadius = 6*autoSizeScaleX;
        _img.layer.masksToBounds = 6*autoSizeScaleX;
        [self.contentView addSubview:_img];
        _img.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 29*autoSizeScaleY).bottomSpaceToView(self.contentView, 29*autoSizeScaleY).widthIs(174*autoSizeScaleX);
        
        
        _btn=[[MyButton alloc]init];
        [_btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#d7d7d7"].CGColor];
        [_btn.layer setBorderWidth:1];
        [_btn.layer setMasksToBounds:YES];
        _btn.layer.cornerRadius = 3*autoSizeScaleX;
        _btn.layer.masksToBounds = 3*autoSizeScaleX;
        _btn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn];
        _btn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 30*autoSizeScaleY).widthIs(148*autoSizeScaleX).heightIs(50*autoSizeScaleY);
        
        
        
        _title=[[UILabel alloc]init];
        _title.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _title.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _title.numberOfLines=2;
        [self.contentView addSubview:_title];
        _title.sd_layout.leftSpaceToView(_img, 20*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).topEqualToView(_img).bottomSpaceToView(_btn, 20*autoSizeScaleY);
        
        UILabel *lbl=[[UILabel alloc]init];
        lbl.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
