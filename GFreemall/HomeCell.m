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
        UIImageView *imgSearch=[[UIImageView alloc]init];
        imgSearch.image=[UIImage imageNamed:@"icon_search"];
        [img addSubview:imgSearch];
        imgSearch.sd_layout.leftSpaceToView(img, 20*autoSizeScaleX).topSpaceToView(img, 20*autoSizeScaleY).bottomSpaceToView(img, 20*autoSizeScaleY).widthIs(30*autoSizeScaleY);
        
        UILabel *lbl=[[UILabel alloc]init];
        lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        lbl.textAlignment=NSTextAlignmentLeft;
        lbl.text=Localized(@"搜索您想找的商品");
        [img addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(imgSearch, 20*autoSizeScaleX).topEqualToView(imgSearch).bottomEqualToView(imgSearch).widthIs(400*autoSizeScaleX);
        
    }
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
