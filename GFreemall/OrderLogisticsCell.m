//
//  OrderLogisticsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderLogisticsCell.h"

@implementation OrderLogisticsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        UILabel *lbl=[[UILabel alloc]init];
        lbl.textColor=[TheParentClass colorWithHexString:@"#000000"];
        lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        lbl.text=Localized(@"配送方式");
        [self.contentView addSubview:lbl];
         lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(200*autoSizeScaleX);
        
        _txt=[[UILabel alloc]init];
        _txt.textColor=[TheParentClass colorWithHexString:@"#000000"];
        _txt.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _txt.text=@"普通物流";
        _txt.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_txt];
        _txt.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(400*autoSizeScaleX);
        
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
