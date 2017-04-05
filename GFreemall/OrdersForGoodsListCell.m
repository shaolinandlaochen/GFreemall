//
//  OrdersForGoodsListCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrdersForGoodsListCell.h"

@implementation OrdersForGoodsListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        
        for (int i=0; i<3; i++) {
            UIImageView *img=[[UIImageView alloc]init];
            img.backgroundColor=[UIColor redColor];
            [img sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491387076615&di=3c952fb8accc913738a0bcbe36b418cb&imgtype=0&src=http%3A%2F%2Fpic40.nipic.com%2F20140412%2F9885883_212844866000_2.jpg"] placeholderImage:[UIImage imageNamed:@""]];
            [self.contentView addSubview:img];
            float x=25+(124+20)*(i%3);
            img.tag=i+1;
            img.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(self.contentView, 26*autoSizeScaleY).widthIs(124*autoSizeScaleX).heightIs(124*autoSizeScaleY);
            
        }
        
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#000000"];
        _number.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _number.text=@"共3件";
        _number.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_number];
        _number.sd_layout.rightSpaceToView(self.contentView, 85*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(100*autoSizeScaleX);
        UIImageView *go=[[UIImageView alloc]init];
        go.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:go];
        go.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 66*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
        
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
