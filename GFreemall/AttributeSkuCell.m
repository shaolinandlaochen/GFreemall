//
//  AttributeSkuCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/2.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AttributeSkuCell.h"

@implementation AttributeSkuCell
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        autoSize
        _string=[[MyButton alloc]init];
        [_string.layer setBorderColor:[TheParentClass colorWithHexString:@"#d7d7d7"].CGColor];
        [_string.layer setBorderWidth:1];
        [_string.layer setMasksToBounds:YES];
        _string.layer.cornerRadius = 6*autoSizeScaleX;
        _string.layer.masksToBounds = 6*autoSizeScaleX;
        [_string setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        _string.titleLabel.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self addSubview:_string];
        _string.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0).topSpaceToView(self, 0);
        
    }
    return self;

}
@end
