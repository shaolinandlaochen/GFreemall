//
//  PayThePasswordCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PayThePasswordCell.h"

@implementation PayThePasswordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _context=[[UILabel alloc]init];
        _context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _context.text=Localized(@"请输入支付密码");
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(250*autoSizeScaleX);
        
        __tf=[[UITextField alloc]init];
        __tf.delegate=self;
        __tf.placeholder=Localized(@"请输入支付密码");
        __tf.secureTextEntry=YES;
        [self.contentView addSubview:__tf];
        __tf.sd_layout.leftSpaceToView(_context, 10*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(300*autoSizeScaleX);
        
        

    }
    
    return self;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [_delegate Psw:textField.text];
    return YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
