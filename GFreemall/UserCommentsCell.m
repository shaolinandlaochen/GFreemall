//
//  UserCommentsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "UserCommentsCell.h"

@implementation UserCommentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        for (int i=0; i<5; i++) {
            float x=25+(20+10)*(i%5);
            UIImageView *img=[[UIImageView alloc]init];
            img.tag=i+1;
            img.image=[UIImage imageNamed:@"icon_star"];
            [self.contentView addSubview:img];
            img.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 16*autoSizeScaleY).widthIs(20*autoSizeScaleX).heightIs(20*autoSizeScaleY);
            
        }
        
        _level=[[UILabel alloc]init];
        _level.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _level.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        _level.text=Localized(@"钻石会员");
        [self.contentView addSubview:_level];
        CGSize size=[TheParentClass StringHeight:@"钻石会员" Lblfont:20*autoSizeScaleY heightOfTheMinus:0];
        _level.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 16*autoSizeScaleY).heightIs(size.height).widthIs(size.width);
        
        _icon=[[UIImageView alloc]init];
        _icon.image=[UIImage imageNamed:@"icon_silver"];
        [self.contentView addSubview:_icon];
        _icon.sd_layout.rightSpaceToView(_level, 5*autoSizeScaleX).topEqualToView(_level).widthIs(22*autoSizeScaleX).heightIs(28*autoSizeScaleY);
        
        UIImageView *image=(UIImageView *)[self.contentView viewWithTag:1];
        _context=[[UILabel alloc]init];
        _context.text=@"股份的股份发的鬼地方个地方官活动覆盖度覅欧冠和大股东和法国ID号发生过一U盾分工地府欧冠和低功耗的覅偶更好地覅规划";
        _context.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _context.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _context.numberOfLines=0;
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(image, 16*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
        
          [self setupAutoHeightWithBottomView:_context bottomMargin:16*autoSizeScaleY];
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
