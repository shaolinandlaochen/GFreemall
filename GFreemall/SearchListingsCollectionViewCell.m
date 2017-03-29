//
//  SearchListingsCollectionViewCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SearchListingsCollectionViewCell.h"

@implementation SearchListingsCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        autoSize
        _image=[[UIImageView alloc]init];
        [self.contentView addSubview:_image];
        _image.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(126*autoSizeScaleY);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[TheParentClass colorWithHexString:@"#999999"];
        _name.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _name.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(_image, 12*autoSizeScaleY).rightEqualToView(_image).bottomSpaceToView(self.contentView, 0);
    }
    return self;
}
@end
