//
//  OrderCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _icon=[[MyButton alloc]init];
        [_icon sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491371461327&di=976e1bab0ad9d9b74809219e3b04a779&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3Db1de0cfbbb389b5038ffe05ab534e5f1%2Fdc547a899e510fb3882b6172db33c895d0430cb9.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        [self.contentView addSubview:_icon];
        _icon.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 12*autoSizeScaleY).bottomSpaceToView(self.contentView, 12*autoSizeScaleY).widthIs(152*autoSizeScaleX);
        
        
        _name=[[UILabel alloc]init];
        _name.numberOfLines=2;
        _name.text=@"是否广东省佛山大佛寺的哈佛收到货佛山地方还是DOI粉红色豆花饭";
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:28*autoSizeScaleX];
        [self.contentView addSubview:_name];
        CGSize size=[TheParentClass StringHeight:_name.text Lblfont:28*autoSizeScaleY heightOfTheMinus:265*autoSizeScaleX];
        _name.sd_layout.leftSpaceToView(_icon, 18*autoSizeScaleX).topEqualToView(_icon).rightSpaceToView(self.contentView, 70).heightIs(size.height);
        
        _text=[[UILabel alloc]init];
        _text.text=@"颜色:黑  吃啊:34";
        _text.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _text.font=[UIFont systemFontOfSize:24*autoSizeScaleX];
        [self.contentView addSubview:_text];
        _text.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 12*autoSizeScaleY).rightEqualToView(_name).heightIs(30*autoSizeScaleY);
        
        //价格
        _picre=[[UILabel alloc]init];
        _picre.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _picre.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picre.text=@"¥10000";
        [self.contentView addSubview:_picre];
        CGSize picSize=[TheParentClass StringHeight:_picre.text Lblfont:26*autoSizeScaleY heightOfTheMinus:265*autoSizeScaleX];
        _picre.sd_layout.leftEqualToView(_name).bottomSpaceToView(self.contentView, 12*autoSizeScaleY).widthIs(picSize.width).heightIs(35*autoSizeScaleY);
        
        _freight=[[UILabel alloc]init];
        _freight.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _freight.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _freight.text=@"(含运费:¥8.0元)";
        [self.contentView addSubview:_freight];
        _freight.sd_layout.leftSpaceToView(_picre, 0).topEqualToView(_picre).rightSpaceToView(self.contentView, 70*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _number.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _number.textAlignment=NSTextAlignmentRight;
        _number.text=@"×1";
        [self.contentView addSubview:_number];
        _number.sd_layout.topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomSpaceToView(self.contentView, 0).widthIs(30);
        
        
        
        
    }
    return self;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
