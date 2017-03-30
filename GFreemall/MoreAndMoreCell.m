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
            [self.contentView addSubview:btn];
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490897527302&di=0a542cf1b83fe58e46c76f2bd4e42210&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fexp%2Fw%3D200%2Fsign%3D2f1b862431fae6cd0cb4ac613fb30f9e%2Ff9198618367adab4f2dd7c508fd4b31c8701e490.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
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
