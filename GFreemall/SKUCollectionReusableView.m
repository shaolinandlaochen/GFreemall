//
//  SKUCollectionReusableView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/2.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SKUCollectionReusableView.h"

@implementation SKUCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        autoSize
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _name.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 25*autoSizeScaleX);
    }
    return self;
}
@end
