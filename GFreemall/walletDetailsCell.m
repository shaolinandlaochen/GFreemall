//
//  walletDetailsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "walletDetailsCell.h"

@implementation walletDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        UILabel *moneyStr=[[UILabel alloc]init];
        moneyStr.textColor=[TheParentClass colorWithHexString:@"#999999"];
        moneyStr.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        moneyStr.text=Localized(@"充值金额");
        [self.contentView addSubview:moneyStr];
        moneyStr.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 45*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        
        _money=[[UILabel alloc]init];
        _money.font=[UIFont systemFontOfSize:50*autoSizeScaleY];
        _money.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _money.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_money];
        _money.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).leftSpaceToView(moneyStr, 10*autoSizeScaleX).bottomEqualToView(moneyStr).heightIs(40*autoSizeScaleY);
        
        
        
        UILabel *stateStr=[[UILabel alloc]init];
        stateStr.textColor=[TheParentClass colorWithHexString:@"#999999"];
        stateStr.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        stateStr.text=Localized(@"充值状态");
        [self.contentView addSubview:stateStr];
        stateStr.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(moneyStr, 42*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        
        _state=[[UILabel alloc]init];
        _state.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _state.textColor=[TheParentClass colorWithHexString:@"#e61f5b"];
        _state.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_state];
        _state.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).leftSpaceToView(stateStr, 10*autoSizeScaleX).bottomEqualToView(stateStr).heightIs(30*autoSizeScaleY);
        
        
        UILabel *timeStr=[[UILabel alloc]init];
        timeStr.textColor=[TheParentClass colorWithHexString:@"#999999"];
        timeStr.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        timeStr.text=Localized(@"充值时间");
        [self.contentView addSubview:timeStr];
        timeStr.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(stateStr, 30*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        _time=[[UILabel alloc]init];
        _time.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _time.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _time.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_time];
        _time.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).leftSpaceToView(timeStr, 10*autoSizeScaleX).bottomEqualToView(timeStr).heightIs(30*autoSizeScaleY);
        
        
        
        UILabel *orderNumberStr=[[UILabel alloc]init];
        orderNumberStr.textColor=[TheParentClass colorWithHexString:@"#999999"];
        orderNumberStr.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        orderNumberStr.text=Localized(@"订单号");
        [self.contentView addSubview:orderNumberStr];
        orderNumberStr.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(timeStr, 30*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        
        _orderNumber=[[UILabel alloc]init];
        _orderNumber.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _orderNumber.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _orderNumber.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_orderNumber];
        _orderNumber.sd_layout.rightSpaceToView(self.contentView, 25*autoSizeScaleX).leftSpaceToView(orderNumberStr, 10*autoSizeScaleX).bottomEqualToView(orderNumberStr).heightIs(30*autoSizeScaleY);
        
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
    }
    return self;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
