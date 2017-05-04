//
//  MyNewsCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyNewsCell.h"

@implementation MyNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        autoSize
        _img=[[UIImageView alloc]init];
        [self.contentView addSubview:_img];
        _img.sd_layout.leftSpaceToView(self.contentView, 25*autoSizeScaleX).topSpaceToView(self.contentView, 29*autoSizeScaleY).bottomSpaceToView(self.contentView, 29*autoSizeScaleX).widthIs(98*autoSizeScaleX);
        

        
        
        _title=[[UILabel alloc]init];
        _title.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _title.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_title];
        _title.sd_layout.leftSpaceToView(_img, 24*autoSizeScaleX).topSpaceToView(self.contentView, 46*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        
        
        _unread=[[UILabel alloc]init];
        _unread.textColor=[UIColor whiteColor];
        _unread.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        _unread.layer.cornerRadius = 5*autoSizeScaleX;
        _unread.layer.masksToBounds = 5*autoSizeScaleX;
        _unread.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_unread];
        _unread.sd_layout.rightEqualToView(_title).topEqualToView(_title);
        
        _context=[[UILabel alloc]init];
        _context.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(_img, 24*autoSizeScaleX).topSpaceToView(_title, 20*autoSizeScaleY).rightSpaceToView(self.contentView, 25*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).heightIs(0.6);
        
        
    }
    return self;

}
-(void)setUnreadStr:(NSString *)unreadStr{
    if ([unreadStr length]>0) {
        autoSize
        _unread.text=unreadStr;
        CGSize size=[TheParentClass StringHeight:unreadStr Lblfont:20*autoSizeScaleX heightOfTheMinus:0];
        _unread.sd_layout.widthIs(size.width+5).heightIs(size.height);
        _unread.backgroundColor=[UIColor redColor];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
