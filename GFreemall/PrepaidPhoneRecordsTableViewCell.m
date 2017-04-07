//
//  PrepaidPhoneRecordsTableViewCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PrepaidPhoneRecordsTableViewCell.h"

@implementation PrepaidPhoneRecordsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        NSArray *Array=@[@"时        间:",@"类        型:",@"发生金额:",@"余        额:",@"备        注:"];
        for (int i=0; i<5; i++) {
            float y=44+(30+25)*(i/1);
            UILabel *lbl=[[UILabel alloc]init];
            lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
            lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
            lbl.text=Localized(Array[i]);
            lbl.tag=i+1;
            [self.contentView addSubview:lbl];
            lbl.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, y*autoSizeScaleY).widthIs(200*autoSizeScaleX).heightIs(30*autoSizeScaleY);
        }
        
        
        
        
        _time=[[UILabel  alloc]init];
        _time.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _time.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_time];
        UILabel *one=(UILabel *)[self.contentView viewWithTag:1];
        _time.sd_layout.leftSpaceToView(one, 10*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomEqualToView(one).heightIs(30*autoSizeScaleY);
        
        
        
        _type=[[UILabel  alloc]init];
        _type.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _type.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_type];
        UILabel *two=(UILabel *)[self.contentView viewWithTag:2];
        _type.sd_layout.leftSpaceToView(two, 10*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomEqualToView(two).heightIs(30*autoSizeScaleY);
        
        
        _money=[[UILabel  alloc]init];
        _money.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _money.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_money];
        UILabel *three=(UILabel *)[self.contentView viewWithTag:3];
        _money.sd_layout.leftSpaceToView(three, 10*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomEqualToView(three).heightIs(30*autoSizeScaleY);
        
        
        _balance=[[UILabel  alloc]init];
        _balance.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _balance.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_balance];
        UILabel *four=(UILabel *)[self.contentView viewWithTag:4];
        _balance.sd_layout.leftSpaceToView(four, 10*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).bottomEqualToView(four).heightIs(30*autoSizeScaleY);
        
        
        
        _context=[[UILabel  alloc]init];
        _context.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _context.numberOfLines=0;
        [self.contentView addSubview:_context];
        UILabel *five=(UILabel *)[self.contentView viewWithTag:5];
        _context.sd_layout.leftSpaceToView(five, 10*autoSizeScaleX).rightSpaceToView(self.contentView, 25*autoSizeScaleX).topEqualToView(five).autoHeightRatio(0);
        
        
        UILabel *line=[[UILabel alloc]init];
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
