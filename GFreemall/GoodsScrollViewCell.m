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
       _scroll=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:[UIImage imageNamed:@"image_zhanweifu_indexbanner"]];
        _scroll.autoScroll=YES;
        _scroll.autoScrollTimeInterval =5;
        [self.contentView addSubview:_scroll];
        _scroll.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).heightIs(750*autoSizeScaleY);

        [self setupAutoHeightWithBottomView:_scroll bottomMargin:0];
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [_delegate BannerReviewImages:_array idx:index];
    
}
-(void)setDic:(NSDictionary *)dic{
    GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:dic];
    GoodsDetailsComm *comm=class.comm;
    NSArray *array=class.listPic;
    _array=[[NSMutableArray  alloc]init];
    for (int i=0; i<array.count; i++) {
        NSString *imgUel=[NSString  stringWithFormat:@"%@%@%@",class.imgSrc,comm.commodityImagesPath,array[i]];
        [_array addObject:imgUel];
    }
    _scroll.imageURLStringsGroup=_array;
}
-(void)setChildDic:(NSDictionary *)ChildDic{


}
@end
