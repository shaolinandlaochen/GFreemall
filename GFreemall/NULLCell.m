//
//  NULLCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/28.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "NULLCell.h"

@implementation NULLCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
