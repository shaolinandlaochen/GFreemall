//
//  ThreePictureCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ThreePictureCell.h"

@implementation ThreePictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _oneBtn=[[MyButton alloc]init];
        _oneBtn.tag=1;
        [self.contentView addSubview:_oneBtn];
        _oneBtn.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).widthIs(431*autoSizeScaleX).heightIs(555*autoSizeScaleY);
        
        _twoBtn=[[MyButton alloc]init];
        _twoBtn.tag=2;
        _twoBtn.backgroundColor=[TheParentClass colorWithHexString:@"#f2f3f7"];
        [self.contentView addSubview:_twoBtn];
        _twoBtn.sd_layout.leftSpaceToView(_oneBtn,12*autoSizeScaleX).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(272*autoSizeScaleY);
        
        _threeBtn=[[MyButton alloc]init];
        _threeBtn.tag=3;
        _threeBtn.backgroundColor=[TheParentClass colorWithHexString:@"#f2f3f7"];
        [self.contentView addSubview:_threeBtn];
        _threeBtn.sd_layout.leftEqualToView(_twoBtn).topSpaceToView(_twoBtn,12*autoSizeScaleY).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 12*autoSizeScaleY);
        
        _smallOneBtn=[[MyButton alloc]init];
        _smallOneBtn.tag=2;
        [_twoBtn addSubview:_smallOneBtn];
        _smallOneBtn.sd_layout.leftSpaceToView(_twoBtn, 66*autoSizeScaleX).topSpaceToView(_twoBtn, 10*autoSizeScaleY).widthIs(174*autoSizeScaleX).heightIs(174*autoSizeScaleX);
        
        _smallTwoBtn=[[MyButton alloc]init];
        _smallTwoBtn.tag=3;
        [_threeBtn addSubview:_smallTwoBtn];
        _smallTwoBtn.sd_layout.leftSpaceToView(_threeBtn, 66*autoSizeScaleX).topSpaceToView(_threeBtn, 10*autoSizeScaleY).widthIs(174*autoSizeScaleX).heightIs(174*autoSizeScaleX);
        
        //商品名称1
        _nameOne=[[UILabel alloc]init];
        _nameOne.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameOne.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameOne.textAlignment=NSTextAlignmentCenter;
        _nameOne.text=@"我是个撒花花那个品";
        [_twoBtn addSubview:_nameOne];
        _nameOne.sd_layout.leftSpaceToView(_twoBtn, 0).topSpaceToView(_smallOneBtn, 15*autoSizeScaleY).rightSpaceToView(_twoBtn, 0).heightIs(30*autoSizeScaleY);
        //商品名称2
        _nameTwo=[[UILabel alloc]init];
        _nameTwo.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameTwo.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameTwo.textAlignment=NSTextAlignmentCenter;
        _nameTwo.text=@"我是个撒花花那个品";
        [_threeBtn addSubview:_nameTwo];
        _nameTwo.sd_layout.leftSpaceToView(_threeBtn, 0).topSpaceToView(_smallTwoBtn, 15*autoSizeScaleY).rightSpaceToView(_threeBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        //商品价格1
        _picOne=[[UILabel alloc]init];
        _picOne.textAlignment=NSTextAlignmentCenter;
        _picOne.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picOne.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picOne.text=@"¥1000";
        [_twoBtn addSubview:_picOne];
        _picOne.sd_layout.leftSpaceToView(_twoBtn, 0).topSpaceToView(_nameOne, 1*autoSizeScaleY).rightSpaceToView(_twoBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品价格2
        _picTwo=[[UILabel alloc]init];
        _picTwo.textAlignment=NSTextAlignmentCenter;
        _picTwo.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picTwo.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picTwo.text=@"¥200";
        [_threeBtn addSubview:_picTwo];
        _picTwo.sd_layout.leftSpaceToView(_threeBtn, 0).topSpaceToView(_nameTwo, 1*autoSizeScaleY).rightSpaceToView(_threeBtn, 0).heightIs(30*autoSizeScaleY);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
