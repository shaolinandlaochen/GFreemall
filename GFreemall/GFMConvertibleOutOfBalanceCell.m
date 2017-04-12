//
//  GFMConvertibleOutOfBalanceCell.m
//  GFreemall
//
//  Created by 123 on 2017/4/12.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GFMConvertibleOutOfBalanceCell.h"

@implementation GFMConvertibleOutOfBalanceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        UILabel *lbl=[[UILabel alloc]init];
        lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        lbl.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:lbl];
        lbl.text=Localized(@"GFM可转出余额(LP)");
        lbl.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 110*autoSizeScaleY).heightIs(35*autoSizeScaleY);
        
        
        _monryStr=[[UILabel alloc]init];
        _monryStr.textAlignment=NSTextAlignmentCenter;
        _monryStr.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _monryStr.font=[UIFont systemFontOfSize:64*autoSizeScaleY];
        [self.contentView addSubview:_monryStr];
        _monryStr.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(lbl, 30*autoSizeScaleY).heightIs(50*autoSizeScaleY);
        
        

        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
