//
//  SetUpCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SetUpCell.h"

@implementation SetUpCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(300*autoSizeScaleX);
        //小箭头
        _img=[[UIImageView alloc]init];
        [self.contentView addSubview:_img];
        _img.sd_layout.rightSpaceToView(self.contentView, 8*autoSizeScaleX).topSpaceToView(self.contentView, 23*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
        _context=[[UILabel alloc]init];
        _context.textAlignment=NSTextAlignmentRight;
        _context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _context.font=[UIFont systemFontOfSize:28*autoSizeScaleX];
        [self.contentView addSubview:_context];
        _context.sd_layout.rightSpaceToView(_img, 10*autoSizeScaleX).topEqualToView(_name).bottomEqualToView(_name).leftSpaceToView(_name, 10*autoSizeScaleX);
        
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
