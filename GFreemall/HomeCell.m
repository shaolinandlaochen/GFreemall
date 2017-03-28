//
//  HomeCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/28.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"search_bg"];
        [self.contentView addSubview:img];
        img.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 12*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 12*autoSizeScaleY);
        
    }
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
