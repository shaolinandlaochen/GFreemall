//
//  BillingInfoNumberCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "BillingInfoNumberCell.h"

@implementation BillingInfoNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    autoSize
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(150*autoSizeScaleX);
        
        _numbber=[[UILabel alloc]init];
        _numbber.textAlignment=NSTextAlignmentRight;
        _numbber.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_numbber];
        _numbber.sd_layout.leftSpaceToView(_name, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
        
        _lines=[[UILabel alloc]init];
        [self.contentView addSubview:_lines];
        _lines.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
        
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
