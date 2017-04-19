//
//  MoreAndMoreCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MoreAndMoreCell.h"

@implementation MoreAndMoreCell
{
    HomePageViewsViewController *_views;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _btn=[[MyButton alloc]init];
        [self.contentView addSubview:_btn];
        _btn.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(328*autoSizeScaleY);
        _views=[[HomePageViewsViewController alloc]init];
        [self.contentView addSubview:_views.view];
        _views.view.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(_btn, 0).heightIs(0);
      
        
        
    }
    return self;
}
-(void)onButtonClick:(UIButton *)btn{

}

-(void)setModel:(NSDictionary *)model{
    autoSize
   // HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:model];
    _views.dic=model;
    [self setupAutoHeightWithBottomView:_views.view bottomMargin:22*autoSizeScaleY];


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
