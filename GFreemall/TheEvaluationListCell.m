//
//  TheEvaluationListCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TheEvaluationListCell.h"

@implementation TheEvaluationListCell

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
        
        _context=[[UILabel alloc]init];
        _context.numberOfLines=0;
        _context.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _context.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 60*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
        
    }
    return self;
}
-(void)setModel:(ProductEvaluationResultList *)model{
autoSize
    //布局小星星
    for (int i=0; i<model.commentGrade; i++) {
        UIImageView *img=(UIImageView *)[self.contentView viewWithTag:i+1];
        img.image=[UIImage imageNamed:@"icon_star_red"];
    }
    _context.text=model.commentContent;
    _context.sd_layout.autoHeightRatio(0);
 [self setupAutoHeightWithBottomView:_context bottomMargin:16*autoSizeScaleY];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
