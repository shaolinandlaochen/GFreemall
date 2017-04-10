//
//  MoneyAnTimeCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MoneyAnTimeCell.h"

@implementation MoneyAnTimeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        _money=[[UILabel alloc]init];
        _money.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _money.font=[UIFont systemFontOfSize:38*autoSizeScaleY];
        _money.text=@"¥948465161";
        [self.contentView addSubview:_money];
        CGSize size=[TheParentClass StringHeight:_money.text Lblfont:38*autoSizeScaleY heightOfTheMinus:0];
        _money.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).widthIs(size.width).heightIs(size.height);
        
        
        UILabel *nameOne=[[UILabel alloc]init];
        nameOne.textColor=[TheParentClass colorWithHexString:@"#292929"];
        nameOne.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        nameOne.text=Localized(@"实付款:");
        nameOne.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:nameOne];
        nameOne.sd_layout.rightSpaceToView(_money, 20*autoSizeScaleX).topSpaceToView(self.contentView, 25*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        _time=[[UILabel alloc]init];
        _time.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _time.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _time.textAlignment=NSTextAlignmentRight;
        _time.text=@"下单时间:2017-1-1 12:58:02";
        [self.contentView addSubview:_time];
        _time.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_money, 14*autoSizeScaleY).widthIs(400).heightIs(30*autoSizeScaleY);
        
        UILabel *_line=[[UILabel alloc]init];
        _line.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        [self addSubview:_line];
        _line.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(20*autoSizeScaleY);
        
    }
    
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
