//
//  UserCommentsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "UserCommentsCell.h"

@implementation UserCommentsCell
{
    UIView *lines;
}
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
            img.image=[UIImage imageNamed:@"icon_star_empty"];
            [self.contentView addSubview:img];
            img.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 16*autoSizeScaleY).widthIs(20*autoSizeScaleX).heightIs(20*autoSizeScaleY);
            
        }
        
        _level=[[UILabel alloc]init];
        _level.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _level.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        [self.contentView addSubview:_level];
        _level.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 16*autoSizeScaleY);
        
        _icon=[[UIImageView alloc]init];
        _icon.image=[UIImage imageNamed:@"icon_register1"];
        [self.contentView addSubview:_icon];
        _icon.sd_layout.rightSpaceToView(_level, 5*autoSizeScaleX).topEqualToView(_level).widthIs(22*autoSizeScaleX).heightIs(28*autoSizeScaleY);
        
        UIImageView *image=(UIImageView *)[self.contentView viewWithTag:1];
        _context=[[UILabel alloc]init];
        _context.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _context.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _context.numberOfLines=0;
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(image, 16*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
        
        lines=[[UIView alloc]init];
        [self.contentView addSubview:lines];
        lines.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(1);
        
        
    }
    return self;

}
-(void)setModel:(GoodsDetailsListComment *)model{
    autoSize
    //布局小星星
    for (int i=0; i<model.commentGrade; i++) {
        UIImageView *img=(UIImageView *)[self.contentView viewWithTag:i+1];
        img.image=[UIImage imageNamed:@"icon_star_red"];
    }
       lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    //给等级赋值
    NSString *levelStr;
    if (model.baseGrade==0) {
        levelStr=Localized(@"注册会员");
        _icon.image=[UIImage imageNamed:@"icon_register1"];
    }else if (model.baseGrade==1){
        levelStr=Localized(@"铜牌会员");
        _icon.image=[UIImage imageNamed:@"icon_copper1"];
    }else if (model.baseGrade==2){
        levelStr=Localized(@"银牌会员");
        _icon.image=[UIImage imageNamed:@"icon_silver1"];
    }else if (model.baseGrade==3){
        levelStr=Localized(@"金牌会员");
        _icon.image=[UIImage imageNamed:@"icon_gold1"];
    }else if (model.baseGrade==4){
        levelStr=Localized(@"钻石会员");
        _icon.image=[UIImage imageNamed:@"icon_diamond1"];
    }
    CGSize size=[TheParentClass StringHeight:levelStr Lblfont:20*autoSizeScaleY heightOfTheMinus:0];
    _level.sd_layout.heightIs(size.height).widthIs(size.width);
    _level.text=levelStr;
    
    _context.text=[NSString stringWithFormat:@"%@",model.commentContent];
 [self setupAutoHeightWithBottomView:_context bottomMargin:16*autoSizeScaleY];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
