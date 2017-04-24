//
//  PaymentToShowCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PaymentToShowCell.h"

@implementation PaymentToShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _context=[[UILabel alloc]init];
        _context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(200*autoSizeScaleX);
        
        
        
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _name.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_name];
        _name.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(300*autoSizeScaleX);
        
        _line=[[UILabel alloc]init];
        _line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:_line];
        _line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(1);
    }
    
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
