//
//  SearchListingsView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SearchListingsView.h"

@implementation SearchListingsView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        autoSize
        
      
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:line];
        line.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 52*autoSizeScaleY).widthIs(178*autoSizeScaleX).heightIs(1);
        
        UILabel *lineTwo=[[UILabel alloc]init];
        lineTwo.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [self addSubview:lineTwo];
        lineTwo.sd_layout.rightSpaceToView(self, 25*autoSizeScaleX).topEqualToView(line).widthIs(178*autoSizeScaleX).heightIs(1);
            
        _name=[[UILabel alloc]init];
        _name.font=[UIFont systemFontOfSize:26*autoSizeScaleX];
        _name.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _name.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(line, 0).topSpaceToView(self, 32*autoSizeScaleY).rightSpaceToView(lineTwo, 0).heightIs(40*autoSizeScaleY);
        
    }
    return self;
}
@end
