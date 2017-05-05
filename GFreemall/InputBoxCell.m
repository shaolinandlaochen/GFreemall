//
//  InputBoxCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "InputBoxCell.h"

@implementation InputBoxCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        //名字
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self.contentView addSubview:_name];
       
        

        
        //电话号码
        
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _number.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
        [self.contentView addSubview:_number];
       
        
        //是否是默认的
        
        _icon=[[UILabel alloc]init];
        _icon.textColor=[UIColor whiteColor];
        _icon.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _icon.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_icon];
        
        
        //详细地址
        
        _context=[[UILabel alloc]init];
        _context.numberOfLines=0;
        _context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _context.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self.contentView addSubview:_context];
       
        
        _btn=[[MyButton alloc]init];
        [_btn setBackgroundImage:[UIImage imageNamed:@"icon_edit"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn];
       
        
        
        
        
        UIView *lines=[[UIView alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:lines];
        lines.sd_layout.leftSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(0.6);
        
        
        
        
    }
    return self;
}
-(void)setModel:(AddressList *)model{
    autoSize
    _name.text=model.addressName;
    _number.text=model.addressPhone;
    
    
    
    NSString *address_country=[NSString stringWithFormat:@"%@",model.addressCountry];
    if ([address_country isEqualToString:@"China"]) {
        address_country=@"中国";
    }
    _context.text=[NSString stringWithFormat:@"%@%@%@%@%@",address_country,model.addressProvince,model.addressCity,model.addressArea,model.addressAddress];
 

    if (model.addressIsdefault==1) {
        _icon.text=Localized(@"默认");
        _icon.backgroundColor=[UIColor redColor];
        
    }
    
    CGSize size=[TheParentClass StringHeight:_name.text Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
    _name.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 25*autoSizeScaleY).widthIs(size.width).heightIs(size.height);
    
    CGSize numberSize=[TheParentClass StringHeight:_number.text Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
    _number.sd_layout.leftSpaceToView(_name, 44*autoSizeScaleX).topEqualToView(_name).widthIs(numberSize.width).heightIs(numberSize.height);
    
    _icon.sd_layout.leftSpaceToView(_number, 25*autoSizeScaleX).topEqualToView(_number).widthIs(60*autoSizeScaleX).heightIs(30*autoSizeScaleY);
    
     _context.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 20*autoSizeScaleY).rightSpaceToView(self.contentView, 95*autoSizeScaleX).autoHeightRatio(0);
    
     _btn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 70*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
    [self setupAutoHeightWithBottomView:_context bottomMargin:30*autoSizeScaleY];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
