//
//  ShippingInformationTableViewCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShippingInformationTableViewCell.h"

@implementation ShippingInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        UILabel *context=[[UILabel alloc]init];
        context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        context.text=Localized(@"配送信息");
        [self.contentView addSubview:context];
        context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 30*autoSizeScaleY).heightIs(35*autoSizeScaleY).widthIs(200*autoSizeScaleX);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _name.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_name];
        _name.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 30*autoSizeScaleY).heightIs(35*autoSizeScaleY).leftSpaceToView(context, 25*autoSizeScaleX);
        
        
        _numberString=[[UILabel alloc]init];
        _numberString.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _numberString.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _numberString.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_numberString];
        _numberString.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_name, 25*autoSizeScaleY).heightIs(35*autoSizeScaleY).leftSpaceToView(context, 25*autoSizeScaleX);
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
