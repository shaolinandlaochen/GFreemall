//
//  ProductDetailsDescriptionCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ProductDetailsDescriptionCell.h"

@implementation ProductDetailsDescriptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize

        //名称
        _title=[[UILabel alloc]init];
        _title.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _title.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
        _title.numberOfLines=0;
        [self.contentView addSubview:_title];
        _title.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
        //描述
        _string=[[UILabel alloc]init];
        _string.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _string.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _string.numberOfLines=0;
        [self.contentView addSubview:_string];
        _string.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
        
        //价格
        _picrice=[[UILabel alloc]init];
        _picrice.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picrice.font=[UIFont systemFontOfSize:44*autoSizeScaleY];
        _picrice.numberOfLines=0;
        [self.contentView addSubview:_picrice];
        _picrice.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
        
        
        
        //[self setupAutoHeightWithBottomView:_picrice bottomMargin:25*autoSizeScaleY];
    }
    return self;
    
}
-(void)setModel:(NSDictionary *)model{
    autoSize
    GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:model];
    GoodsDetailsComm *comm=class.comm;
    _title.text=[NSString stringWithFormat:@"%@",comm.commodityName];
    _string.text=[NSString stringWithFormat:@"%@",comm.commodityDigest];
    _picrice.text=[NSString stringWithFormat:@"%.2f",comm.commodityGrade];
    _title.sd_layout.autoHeightRatio(0);
    _string.sd_layout.autoHeightRatio(0).topSpaceToView(_title, 16*autoSizeScaleY);
    _picrice.sd_layout.autoHeightRatio(0).topSpaceToView(_string, 30*autoSizeScaleY);
    
    [self setupAutoHeightWithBottomView:_picrice bottomMargin:25*autoSizeScaleY];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
