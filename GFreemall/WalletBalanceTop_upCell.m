//
//  WalletBalanceTop_upCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "WalletBalanceTop_upCell.h"

@implementation WalletBalanceTop_upCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        UILabel *_context=[[UILabel alloc]init];
        _context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_context];
        _context.text=@"钱包余额";
        _context.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 25*autoSizeScaleY).heightIs(35*autoSizeScaleY).widthIs(200*autoSizeScaleX);
        
        
        
        
        _name=[[UILabel alloc]init];
        _name.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _name.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_name];
        _name.text=@"¥:588";
        _name.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 25*autoSizeScaleY).heightIs(35*autoSizeScaleY).widthIs(300*autoSizeScaleX);
        
        
        _btn=[[MyButton alloc]init];
        _btn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
         [_btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#999999"].CGColor];
        [_btn.layer setBorderWidth:1];
        [_btn setTitle:@"充值" forState:UIControlStateNormal];
        [_btn setTitleColor:[TheParentClass colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        [_btn.layer setMasksToBounds:YES];
        _btn.layer.cornerRadius = 4*autoSizeScaleX;
        _btn.layer.masksToBounds = 4*autoSizeScaleX;
        [self.contentView addSubview:_btn];
        _btn.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(_name, 25*autoSizeScaleX).widthIs(110*autoSizeScaleX).heightIs(44*autoSizeScaleY);
        
        
    }
    
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
