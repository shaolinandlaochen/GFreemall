//
//  basicInformationCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "basicInformationCell.h"

@implementation basicInformationCell

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
        _name.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(200*autoSizeScaleX);
        
        _img=[[UIImageView alloc]init];
        [self.contentView addSubview:_img];
        _img.sd_layout.topSpaceToView(self.contentView, 23*autoSizeScaleY).bottomSpaceToView(self.contentView, 23*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).widthIs(0);
        
        _string=[[UILabel alloc]init];
        _string.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _string.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _string.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_string];
        _string.sd_layout.leftSpaceToView(_name, 20*autoSizeScaleX).rightSpaceToView(_img, 0*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
        
        
    }
    
    return self;

}
-(void)setImgName:(NSString *)imgName{
    autoSize
    _img.image=[UIImage imageNamed:imgName];
    _img.sd_layout.widthIs(44*autoSizeScaleX);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
