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
            img.image=[UIImage imageNamed:@"icon_star"];
            [self.contentView addSubview:img];
            img.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 16*autoSizeScaleY).widthIs(20*autoSizeScaleX).heightIs(20*autoSizeScaleY);
            
        }
        
        _context=[[UILabel alloc]init];
        _context.numberOfLines=0;
        _context.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _context.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _context.text=@"顺风顺水放电饭锅ID你给的覅规定发给我哦电饭锅我of打工获得方式告诉对方不够的说法高回报的房间观看电视发布更多方法及个别地方";
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 60*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
         [self setupAutoHeightWithBottomView:_context bottomMargin:16*autoSizeScaleY];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
