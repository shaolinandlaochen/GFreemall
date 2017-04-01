//
//  CostCalculationCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "CostCalculationCell.h"

@implementation CostCalculationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        
        
        
     
      
        _discount=[[UILabel alloc]init];
        _discount.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _discount.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _discount.text=Localized(@"无折扣");
        [self.contentView addSubview:_discount];
        _discount.sd_layout.leftSpaceToView(self.contentView, 90*autoSizeScaleX).topSpaceToView(self.contentView, 36*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
        
        _freight=[[UILabel alloc]init];
        _freight.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _freight.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _freight.text=Localized(@"5.00");
        [self.contentView addSubview:_freight];
        _freight.sd_layout.leftSpaceToView(self.contentView, 90*autoSizeScaleX).topSpaceToView(_discount, 36*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).autoHeightRatio(0);
        
        NSArray *nameArray=@[@"折扣",@"运费"];
        for (int i=0; i<2; i++) {
            UILabel *lbl=[[UILabel alloc]init];
            lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
            lbl.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
            lbl.text=Localized(nameArray[i]);
            [self.contentView addSubview:lbl];
            if (i==0) {
                 lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topEqualToView(_discount).widthIs(60*autoSizeScaleX).autoHeightRatio(0);
            }else{
             lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topEqualToView(_freight).widthIs(60*autoSizeScaleX).autoHeightRatio(0);
            }
           
            
        }
        
        
        
        
        [self setupAutoHeightWithBottomView:_freight bottomMargin:36*autoSizeScaleY];
        
    
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
