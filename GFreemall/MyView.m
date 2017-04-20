//
//  MyView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    autoSize
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        _img=[[UIImageView alloc]init];
        [self addSubview:_img];
        _img.sd_layout.leftSpaceToView(self, 25*autoSizeScaleX).topSpaceToView(self, 27*autoSizeScaleY).bottomSpaceToView(self, 27*autoSizeScaleY).widthIs(34*autoSizeScaleX);
        _lbl=[[UILabel alloc]init];
        _lbl.textColor=[TheParentClass colorWithHexString:@"#ff6500"];
        _lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self addSubview:_lbl];
        _lbl.sd_layout.leftSpaceToView(_img, 2).topEqualToView(_img).bottomEqualToView(_img).widthIs(200);
        
        
        
        _context=[[UILabel alloc]init];
        _context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [self addSubview:_context];
        _context.sd_layout.topSpaceToView(self, 0).bottomSpaceToView(self, 0);
        
        
        _imgviiew=[[UIImageView alloc]init];
        [self addSubview:_imgviiew];
        _imgviiew.sd_layout.rightSpaceToView(_context, 2).topEqualToView(_img).bottomEqualToView(_img).widthIs(34*autoSizeScaleX);
        
        
        _img1=[[UIImageView alloc]init];
        [self addSubview:_img1];
        _img1.sd_layout.rightSpaceToView(_imgviiew, 2).topSpaceToView(self, 38*autoSizeScaleY).bottomSpaceToView(self, 38*autoSizeScaleY).widthIs(42*autoSizeScaleX);
        
        
        _img2=[[UIImageView alloc]init];
        [self addSubview:_img2];
        _img2.sd_layout.topSpaceToView(self, 38*autoSizeScaleY).bottomSpaceToView(self, 38*autoSizeScaleY).widthIs(42*autoSizeScaleX);
        
        
        
    }
    return self;
}
-(void)setString:(NSString *)string{
    autoSize
    CGSize size=[TheParentClass StringHeight:string Lblfont:30*autoSizeScaleY heightOfTheMinus:0];
    _context.text=string;
    float xxx=WIDTH-size.width;
    _context.sd_layout.leftSpaceToView(self, xxx/2).rightSpaceToView(self, xxx/2);
    _img2.sd_layout.leftSpaceToView(_context, 2);
}
@end
