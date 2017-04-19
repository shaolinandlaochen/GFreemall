//
//  NewAddInputBoxCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "NewAddInputBoxCell.h"

@implementation NewAddInputBoxCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_name];
        
        _context=[[MyTextField alloc]init];
        _context.delegate=self;
        _context.keyboardType=UIKeyboardTypeDefault;
        _context.borderStyle = UIKeyboardTypeDefault;
        _context.returnKeyType=UIReturnKeyDone;
        _context.clearButtonMode = UITextFieldViewModeAlways;//右侧添加叉号
        _context.adjustsFontSizeToFitWidth = YES;//文本自适应
        _context.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_context];
        
        
        
        UILabel *lines=[[UILabel alloc]init];
        lines.backgroundColor=[TheParentClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:lines];
        lines.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
    }
    return self;
}

-(void)setString:(NSString *)string{
    autoSize
    _name.text=string;
    CGSize size=[TheParentClass StringHeight:string Lblfont:30*autoSizeScaleY heightOfTheMinus:0];
    _name.sd_layout.leftSpaceToView(self.contentView, 30*autoSizeScaleX).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(size.width);
    
    _context.sd_layout.leftSpaceToView(_name, 25*autoSizeScaleX).topEqualToView(_name).bottomEqualToView(_name).rightSpaceToView(self.contentView, 25*autoSizeScaleX);
}
-(void)setPlaceholder:(NSString *)placeholder{
    _context.placeholder=placeholder;
}

- (void)textFieldDidEndEditing:(MyTextField *)textField{
    [_delegate NewString:textField.text indexPath:textField.indexPath];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
