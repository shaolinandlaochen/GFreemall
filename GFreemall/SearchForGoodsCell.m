//
//  SearchForGoodsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SearchForGoodsCell.h"

@implementation SearchForGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    autoSize
        //商品图片
        _img=[[UIImageView alloc]init];

        [self.contentView addSubview:_img];
        _img.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0.5).bottomSpaceToView(self.contentView, 0.5).widthIs(180*autoSizeScaleX);
        //商品名称
        _title=[[UILabel alloc]init];
        _title.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _title.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
        _title.numberOfLines=2;
        [self.contentView addSubview:_title];
        _title.sd_layout.leftSpaceToView(_img, 20*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).rightSpaceToView(self.contentView, 40*autoSizeScaleX).autoHeightRatio(0);
        
        //商品价格
        _picre=[[UILabel alloc]init];
        _picre.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picre.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self.contentView addSubview:_picre];
        _picre.sd_layout.leftSpaceToView(_img, 20*autoSizeScaleX).rightSpaceToView(self.contentView, 40*autoSizeScaleX).bottomSpaceToView(self.contentView, 32*autoSizeScaleY).autoHeightRatio(0);
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(_img, 20*autoSizeScaleX).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.5);
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
