//
//  OrderAmountDetailCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderAmountDetailCell.h"

@implementation OrderAmountDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        UILabel *nameOne=[[UILabel alloc]init];
        nameOne.textColor=[TheParentClass colorWithHexString:@"#999999"];
        nameOne.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        nameOne.text=Localized(@"商品金额");
        [self.contentView addSubview:nameOne];
        nameOne.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 30*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        UILabel *nametWO=[[UILabel alloc]init];
        nametWO.textColor=[TheParentClass colorWithHexString:@"#999999"];
        nametWO.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        nametWO.text=Localized(@"运费");
        [self.contentView addSubview:nametWO];
        nametWO.sd_layout.leftEqualToView(nameOne).topSpaceToView(nameOne, 30*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        
        _AmountOfGoods=[[UILabel alloc]init];
        _AmountOfGoods.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _AmountOfGoods.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _AmountOfGoods.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_AmountOfGoods];
        _AmountOfGoods.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topEqualToView(nameOne).leftSpaceToView(nameOne, 25*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        _freight=[[UILabel alloc]init];
        _freight.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _freight.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _freight.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_freight];
        _freight.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topEqualToView(nametWO).leftSpaceToView(nametWO, 25*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        
    }

    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
