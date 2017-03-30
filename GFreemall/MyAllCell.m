//
//  MyAllCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/30.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyAllCell.h"

@implementation MyAllCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _myView=[[MyInformationView alloc]init];
        _myView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_myView];
        _myView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
