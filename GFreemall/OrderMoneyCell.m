//
//  OrderMoneyCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderMoneyCell.h"

@implementation OrderMoneyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        
        _picOne=[[UILabel alloc]init];
        _picOne.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picOne.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _picOne.textAlignment=NSTextAlignmentRight;
        
        [self.contentView addSubview:_picOne];
        _picOne.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 30*autoSizeScaleY).widthIs(300*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        _picTwo=[[UILabel alloc]init];
        _picTwo.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        _picTwo.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _picTwo.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_picTwo];
        _picTwo.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 90*autoSizeScaleY).widthIs(300*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        
        for (int i=0; i<2; i++) {
            float y=30+(30+30)*(i/1);
            UILabel *lbl=[[UILabel alloc]init];
            if (i==0) {
                lbl.text=Localized(@"商品金额");
                
            }else{
            lbl.text=Localized(@"运费");
            }
            lbl.textColor=[TheParentClass colorWithHexString:@"#000000"];
            lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
            [self.contentView addSubview:lbl];
            lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, y*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        }
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
