//
//  GoodsScrollViewCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GoodsScrollViewCell.h"

@implementation GoodsScrollViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
       _scroll=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scroll.autoScroll=YES;
        _scroll.autoScrollTimeInterval =5;
        [self.contentView addSubview:_scroll];
        _scroll.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).heightIs(750*autoSizeScaleY);
        //名称
        _title=[[UILabel alloc]init];
        _title.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _title.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
        _title.numberOfLines=0;
        _title.text=@"伤风败俗发生部分开始放不开闪电风暴伤风败俗的封闭式的开发商打副本";
        [self.contentView addSubview:_title];
        _title.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_scroll, 20*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
        //描述
        _string=[[UILabel alloc]init];
        _string.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _string.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _string.numberOfLines=0;
        _string.text=@"伤风败俗发sdradaff法国恢复和辅导员你你你何方妖孽返回法国恢复到合肥的女孩风格和你废话南方姑娘回复你本";
        [self.contentView addSubview:_string];
        _string.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_title, 16*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
                                                                                             
        //价格
        _picrice=[[UILabel alloc]init];
        _picrice.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picrice.font=[UIFont systemFontOfSize:44*autoSizeScaleY];
        _picrice.numberOfLines=0;
        _picrice.text=@"¥6416131";
        [self.contentView addSubview:_picrice];
        _picrice.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_string, 30*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
        
        
        
        
        
        [self setupAutoHeightWithBottomView:_picrice bottomMargin:10];
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [_delegate GoodsScroll:index];
}
@end
