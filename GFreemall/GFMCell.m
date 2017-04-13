//
//  GFMCell.m
//  GFreemall
//
//  Created by 123 on 2017/4/11.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GFMCell.h"

@implementation GFMCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        
        _bgImage=[[UIImageView alloc]init];
        _bgImage.userInteractionEnabled = YES;
        [self.contentView addSubview:_bgImage];
        _bgImage.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 20*autoSizeScaleY);
        
        _typeImg=[[UIImageView alloc]init];
        [_bgImage addSubview:_typeImg];
        _typeImg.sd_layout.leftSpaceToView(_bgImage, 22*autoSizeScaleX).topSpaceToView(_bgImage, 21*autoSizeScaleY).widthIs(48*autoSizeScaleX).heightIs(48*autoSizeScaleY);
        
        _type=[[UILabel alloc]init];
        _type.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _type.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_bgImage addSubview:_type];
        _type.sd_layout.leftSpaceToView(_typeImg, 17*autoSizeScaleX).topEqualToView(_typeImg).widthIs(250*autoSizeScaleX).heightIs(48*autoSizeScaleY);
        
        
        //查看明细
        _CheckTheDetailsBtn =[[MyButton alloc]init];
        [_CheckTheDetailsBtn setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _CheckTheDetailsBtn.titleLabel.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [_CheckTheDetailsBtn setTitle:Localized(@"查看明细") forState:UIControlStateNormal];
        [_bgImage addSubview:_CheckTheDetailsBtn];
        _CheckTheDetailsBtn.sd_layout.rightSpaceToView(_bgImage, 20*autoSizeScaleX).topEqualToView(_type).widthIs(120*autoSizeScaleY).heightIs(48*autoSizeScaleY);
        
        
        
        
        
        
        UILabel *_TotalAssetsStr=[[UILabel alloc]init];
        _TotalAssetsStr.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _TotalAssetsStr.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _TotalAssetsStr.text=Localized(@"总资产");
        CGSize TotalAssetsStrSize =[TheParentClass StringHeight:_TotalAssetsStr.text Lblfont:28*autoSizeScaleX heightOfTheMinus:0];
        [_bgImage addSubview:_TotalAssetsStr];
        _TotalAssetsStr.sd_layout.leftEqualToView(_typeImg).topSpaceToView(_typeImg, 40*autoSizeScaleY).widthIs(TotalAssetsStrSize.width).heightIs(TotalAssetsStrSize.height);
        
       UILabel * _FreezeMoneStr=[[UILabel alloc]init];
        _FreezeMoneStr.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _FreezeMoneStr.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _FreezeMoneStr.text=Localized(@"冻结资产");
        CGSize FreezeMoneStrSize =[TheParentClass StringHeight:_FreezeMoneStr.text Lblfont:28*autoSizeScaleX heightOfTheMinus:0];
        [_bgImage addSubview:_FreezeMoneStr];
        _FreezeMoneStr.sd_layout.leftEqualToView(_typeImg).topSpaceToView(_TotalAssetsStr, 28*autoSizeScaleY).widthIs(FreezeMoneStrSize.width).heightIs(FreezeMoneStrSize.height);
        
        
        
        
        
        
        
        //总资产
        _TotalAssets=[[UILabel alloc]init];
        _TotalAssets.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _TotalAssets.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_bgImage addSubview:_TotalAssets];
        _TotalAssets.sd_layout.leftSpaceToView(_TotalAssetsStr, 46*autoSizeScaleX).topSpaceToView(_typeImg, 40*autoSizeScaleY).rightSpaceToView(_bgImage, 25*autoSizeScaleX).heightIs(TotalAssetsStrSize.height);
        
        _FreezeMone=[[UILabel alloc]init];
        _FreezeMone.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _FreezeMone.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_bgImage addSubview:_FreezeMone];
        _FreezeMone.sd_layout.leftEqualToView(_TotalAssets).topSpaceToView(_TotalAssets, 28*autoSizeScaleY).rightSpaceToView(_bgImage, 25*autoSizeScaleX).heightIs(TotalAssetsStrSize.height);
        
        
        
        UILabel *AvailableCapitalAmountLbl=[[UILabel alloc]init];
        AvailableCapitalAmountLbl.text=Localized(@"可用资产");
        AvailableCapitalAmountLbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        AvailableCapitalAmountLbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        [_bgImage addSubview:AvailableCapitalAmountLbl];
        CGSize avSize=[TheParentClass StringHeight:AvailableCapitalAmountLbl.text Lblfont:28*autoSizeScaleY heightOfTheMinus:0];
        AvailableCapitalAmountLbl.sd_layout.leftEqualToView(_typeImg).topSpaceToView(_bgImage, 245*autoSizeScaleY).widthIs(avSize.width).bottomSpaceToView(_bgImage, 0);
        
        //可用资产
        _availableMoney=[[UILabel alloc]init];
        _availableMoney.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _availableMoney.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [_bgImage addSubview:_availableMoney];
        _availableMoney.sd_layout.leftSpaceToView(AvailableCapitalAmountLbl, 5*autoSizeScaleX).topEqualToView(AvailableCapitalAmountLbl).bottomEqualToView(AvailableCapitalAmountLbl).rightSpaceToView(_bgImage, 150*autoSizeScaleX);
        
        
        //转出
        _RollOutBtn=[[MyButton alloc]init];
        [_RollOutBtn setTitle:Localized(@"转出") forState:UIControlStateNormal];
        [_RollOutBtn setTitleColor:[TheParentClass colorWithHexString:@"#77adc4"] forState:UIControlStateNormal];
        _RollOutBtn.titleLabel.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [_RollOutBtn.layer setBorderColor:[TheParentClass colorWithHexString:@"#77adc4"].CGColor];
        [_RollOutBtn.layer setBorderWidth:1];
        [_RollOutBtn.layer setMasksToBounds:YES];
        _RollOutBtn.layer.cornerRadius = 4*autoSizeScaleX;
        _RollOutBtn.layer.masksToBounds = 4*autoSizeScaleX;
        [_bgImage addSubview:_RollOutBtn];
        _RollOutBtn.sd_layout.rightSpaceToView(_bgImage, 23*autoSizeScaleX).bottomSpaceToView(_bgImage, 23*autoSizeScaleY).widthIs(100*autoSizeScaleY).heightIs(50*autoSizeScaleY);
        
        
        
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
