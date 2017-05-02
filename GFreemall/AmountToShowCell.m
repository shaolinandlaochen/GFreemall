//
//  AmountToShowCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AmountToShowCell.h"

@implementation AmountToShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        UILabel *lbl=[[UILabel alloc]init];
        lbl.text=Localized(@"订单金额");
        lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
        lbl.textAlignment=NSTextAlignmentCenter;
        lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 62*autoSizeScaleY).heightIs(35*autoSizeScaleY);
        
        _picre=[[UILabel alloc]init];
        _picre.textColor=[TheParentClass colorWithHexString:@"#000000"];
        _picre.textAlignment=NSTextAlignmentCenter;
        _picre.font=[UIFont systemFontOfSize:68*autoSizeScaleY];
        [self.contentView addSubview:_picre];
        _picre.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(lbl, 28*autoSizeScaleY).heightIs(100*autoSizeScaleY);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);

        
        
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
