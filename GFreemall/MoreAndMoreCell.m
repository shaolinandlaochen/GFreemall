//
//  MoreAndMoreCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MoreAndMoreCell.h"

@implementation MoreAndMoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        for (int i=0; i<3; i++) {
            float x=0+(250+0)*(i%3);
           
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=i+1;
            btn.backgroundColor=[UIColor redColor];
            [self.contentView addSubview:btn];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490782465230&di=46c86f2fae3decbb9fc5951dbc9b81a6&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D5ba27fbe0ef431adbcd243317b36ac0f%2F4b6374cb0a46f21f571cc47ff4246b600c33ae18.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
            btn.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 0).widthIs(250*autoSizeScaleX).heightIs(250*autoSizeScaleY);
           
            
            
            UILabel *name=[[UILabel alloc]init];
            name.text=@"我是名字";
            name.textAlignment=NSTextAlignmentCenter;
            name.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
            name.textColor=[TheParentClass colorWithHexString:@"#292929"];
            [self.contentView addSubview:name];
            name.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 264*autoSizeScaleY).widthIs(250*autoSizeScaleX).heightIs(30*autoSizeScaleY);
            
            UILabel *pic=[[UILabel alloc]init];
            pic.text=@"¥2000";
            pic.textAlignment=NSTextAlignmentCenter;
            pic.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            pic.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
            [self.contentView addSubview:pic];
            pic.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(name, 24*autoSizeScaleY).widthIs(250*autoSizeScaleX).heightIs(30*autoSizeScaleY);
            
            
        }
    }
    return self;
}
-(void)onButtonClick:(UIButton *)btn{

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
