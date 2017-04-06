//
//  EditTheCollectionCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "EditTheCollectionCell.h"

@implementation EditTheCollectionCell
{
    UIImageView *image;
    UILabel *title;
    UILabel *picre;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        //商品图片
        //选中按钮
        _selectedBtn=[[MyButton alloc]init];
        [_selectedBtn setImage:[UIImage imageNamed:@"icon_circle"] forState:UIControlStateNormal];
        [self.contentView addSubview:_selectedBtn];
        _selectedBtn.sd_layout.leftSpaceToView(self.contentView, 10*autoSizeScaleX).topSpaceToView(self.contentView, 60*autoSizeScaleY).widthIs(60*autoSizeScaleX).heightIs(60*autoSizeScaleY);
        
        
        image=[[UIImageView alloc]init];
        [image sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490954273860&di=e32dc53d7ecf885b666575e77ad82df6&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F13%2F89%2F98%2F75758PICAU3_1024.jpg"] placeholderImage:[UIImage imageNamed:@""]];
        [self.contentView addSubview:image];
        image.sd_layout.leftSpaceToView(self.contentView, 70*autoSizeScaleX).topSpaceToView(self.contentView, 0.5).bottomSpaceToView(self.contentView, 0.5).widthIs(180*autoSizeScaleX);
        //商品名称
        title=[[UILabel alloc]init];
        title.textColor=[TheParentClass colorWithHexString:@"#292929"];
        title.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        title.numberOfLines=2;
        title.text=@"我是if都是福克斯发生部分is大部分is办法is电饭煲等死吧";
        [self.contentView addSubview:title];
        title.sd_layout.leftSpaceToView(image, 20*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).rightSpaceToView(self.contentView, 40*autoSizeScaleX).autoHeightRatio(0);
        
        //商品价格
        picre=[[UILabel alloc]init];
        picre.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        picre.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        picre.text=@"¥:999999";
        [self.contentView addSubview:picre];
        picre.sd_layout.leftSpaceToView(image, 20*autoSizeScaleX).rightSpaceToView(self.contentView, 40*autoSizeScaleX).bottomSpaceToView(self.contentView, 32*autoSizeScaleY).autoHeightRatio(0);
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(image, 20*autoSizeScaleX).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.5);
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
