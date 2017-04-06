//
//  InternalOrderButtonCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "InternalOrderButtonCell.h"

@implementation InternalOrderButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _OrderView=[[OrderButtonView alloc]init];
        [self.contentView addSubview:_OrderView];
        _OrderView.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
