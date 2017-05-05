//
//  WalletBalanceDisplayCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "WalletBalanceDisplayCell.h"

@implementation WalletBalanceDisplayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor=[TheParentClass colorWithHexString:@"#292929"];
        autoSize
        UILabel *title=[[UILabel alloc]init];
        title.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        title.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        title.text=Localized(@"当前余额");
        [self.contentView addSubview:title];
        title.sd_layout.leftSpaceToView(self.contentView, 28*autoSizeScaleX).topSpaceToView(self.contentView, 40*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(40*autoSizeScaleY);
        
        
        
        
        _pirce=[[UILabel alloc]init];
        _pirce.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _pirce.font=[UIFont systemFontOfSize:70*autoSizeScaleY];
        _pirce.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_pirce];
        _pirce.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 140*autoSizeScaleY).leftSpaceToView(self.contentView, 25*autoSizeScaleX).heightIs(56*autoSizeScaleY);
        
        
        
        
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
