//
//  babbarButton.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "babbarButton.h"

@implementation babbarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //    self.titleLabel.font = [UIFont systemFontOfSize:14];
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    autoSize
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height *0.50;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(titleX+1, titleY+(8*autoSizeScaleY), titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    autoSize
    CGFloat imageW = CGRectGetWidth(contentRect);
    CGFloat imageH = contentRect.size.height * 0.32;
    return CGRectMake(0, contentRect.size.height * 0.19, imageW, imageH+(10*autoSizeScaleY));
}
@end
