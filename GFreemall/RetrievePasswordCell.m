//
//  RetrievePasswordCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "RetrievePasswordCell.h"

@implementation RetrievePasswordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:Localized(@"忘记支付密码?") forState:UIControlStateNormal];
        _btn.titleLabel.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        [_btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn];
        _btn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 20*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(60*autoSizeScaleY);
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
