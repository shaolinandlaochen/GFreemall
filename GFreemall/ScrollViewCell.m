//
//  ScrollViewCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell
{
    SDCycleScrollView *scroll;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        scroll=[SDCycleScrollView cycleScrollViewWithFrame:frame(0, 0, 750, 234) delegate:self placeholderImage:[UIImage imageNamed:@"image_zhanweifu_indexbanner"]];
        scroll.autoScroll=YES;
        scroll.autoScrollTimeInterval =5;
        [self.contentView addSubview:scroll];
        scroll.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);

    }
    return self;
}

/** 点击图片回调  顶部滚动视图 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
 
    [_delegate HomeScroll:index];
}
-(void)setDic:(NSDictionary *)Dic{
    NSMutableArray *imgArray=[[NSMutableArray  alloc]init];
    HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:Dic];
    
    for (int i=0; i<class.ads.ad1.count; i++) {
        HomeAd5 *ad5=class.ads.ad5[i];
        NSString *imgUrls=[NSString stringWithFormat:@"%@%@",class.imgSrc,ad5.adsImages];
        [imgArray addObject:imgUrls];
        
    }
    
    scroll.imageURLStringsGroup=imgArray;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
