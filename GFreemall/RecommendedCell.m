//
//  RecommendedCell.m
//  GFreemall
//
//  Created by 123 on 2017/4/12.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "RecommendedCell.h"

@implementation RecommendedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _bjImagge=[[UIImageView alloc]init];
        _bjImagge.layer.cornerRadius = 16*autoSizeScaleX;
        _bjImagge.layer.masksToBounds = 16*autoSizeScaleX;
        _bjImagge.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_bjImagge];
        _bjImagge.sd_layout.leftSpaceToView(self.contentView, 24*autoSizeScaleX).topSpaceToView(self.contentView, 24*autoSizeScaleY).rightSpaceToView(self.contentView, 24*autoSizeScaleX).bottomSpaceToView(self.contentView, 0);
        
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
        _name.text=Localized(@"用户名:小明和小红");
        [_bjImagge addSubview:_name];
        _name.sd_layout.leftSpaceToView(_bjImagge, 30*autoSizeScaleX).topSpaceToView(_bjImagge, 42*autoSizeScaleY).rightSpaceToView(_bjImagge, 30*autoSizeScaleX).heightIs(40*autoSizeScaleY);
        
        //正在进阶
        UILabel *AreAdvancedLbl=[[UILabel alloc]init];
        AreAdvancedLbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        AreAdvancedLbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        AreAdvancedLbl.text=Localized(@"正在进阶:");
        [_bjImagge addSubview:AreAdvancedLbl];
        CGSize areSize=[TheParentClass StringHeight:AreAdvancedLbl.text Lblfont:28*autoSizeScaleY heightOfTheMinus:0];
        AreAdvancedLbl.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 20*autoSizeScaleY).widthIs(areSize.width).heightIs(40*autoSizeScaleY);
        
        //进度
        _strings=[[UILabel alloc]init];
        _strings.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _strings.textColor=[TheParentClass colorWithHexString:@"#e61f5b"];
        [_bjImagge addSubview:_strings];
        _strings.sd_layout.leftSpaceToView(AreAdvancedLbl, 10*autoSizeScaleX).topEqualToView(AreAdvancedLbl).heightIs(40*autoSizeScaleY).rightSpaceToView(_bjImagge, 30*autoSizeScaleX);
        
        
        UIImageView *line=[[UIImageView alloc]init];
        line.image=[UIImage imageNamed:@"line_dotted"];
        [_bjImagge addSubview:line];
        line.sd_layout.leftSpaceToView(_bjImagge, 0).rightSpaceToView(_bjImagge, 0).bottomSpaceToView(_bjImagge, 70*autoSizeScaleY).heightIs(1);
        
        
        
        //时间
        
        _timeStr=[[UILabel alloc]init];
        _timeStr.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _timeStr.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [_bjImagge addSubview:_timeStr];
        _timeStr.sd_layout.leftEqualToView(AreAdvancedLbl).rightSpaceToView(_bjImagge, 30*autoSizeScaleX).bottomSpaceToView(_bjImagge, 0).topSpaceToView(line, 0);
        
        
        
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
