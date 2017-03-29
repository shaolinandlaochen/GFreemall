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
        scroll=[SDCycleScrollView cycleScrollViewWithFrame:frame(0, 0, 750, 234) delegate:self placeholderImage:[UIImage imageNamed:@"750-750"]];
        scroll.autoScroll=YES;
        scroll.autoScrollTimeInterval =5;
        [self.contentView addSubview:scroll];
        _MyBtn=[[MyButton alloc]init];
        _MyBtn.frame=frame(0, 0, 750, 234);
        [self.contentView addSubview:_MyBtn];
    }
    return self;
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSString *str=[NSString stringWithFormat:@"%ld",index];
    _MyBtn.string=str;
}
/** 点击图片回调  顶部滚动视图 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    //NSString *str=[NSString stringWithFormat:@"%ld",index];
}
-(void)setArray:(NSArray *)Array{
    scroll.imageURLStringsGroup=Array;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
