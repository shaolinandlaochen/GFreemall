//
//  DrawACircle.m
//  GFreemall
//
//  Created by 123 on 2017/4/13.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "DrawACircle.h"

@implementation DrawACircle

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        autoSize
        
        
        //圆圈背景

        
        //圆圈(第一个小圈圈)
        //先画一个圆
        
        
        CGRect rect = CGRectMake(30*autoSizeScaleX, 30*autoSizeScaleY, 240*autoSizeScaleX, 240*autoSizeScaleX);
        UIBezierPath *beizPath=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50];
        //先画一个圆
        CAShapeLayer *layer=[CAShapeLayer layer];
        layer.path=beizPath.CGPath;
        layer.fillColor=[UIColor clearColor].CGColor;//填充色
        layer.strokeColor=[TheParentClass colorWithHexString:@"#dcdcdc"].CGColor;//边框颜色
        layer.lineWidth=12*autoSizeScaleX;
        layer.lineCap=kCAFillRuleNonZero;//线框类型
        [self.layer addSublayer:layer];
        
        
        UIView *bjTwo=[[UIView alloc]init];
        bjTwo.backgroundColor=[UIColor clearColor];
        [self addSubview:bjTwo];
        bjTwo.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0);
        
        
        
        //在画一个圆
        CAGradientLayer* gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)[TheParentClass colorWithHexString:@"#f19d40"].CGColor, (__bridge id)[TheParentClass colorWithHexString:@"#e61f5b"].CGColor];
        gradientLayer.locations = @[@0.0,@1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = CGRectMake(20*autoSizeScaleX, 20*autoSizeScaleY, 260*autoSizeScaleX, 260*autoSizeScaleX);
        [bjTwo.layer addSublayer:gradientLayer];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.strokeEnd = 0;
        _shapeLayer.strokeStart = 0;
        CGRect rectThhee=CGRectMake(10*autoSizeScaleX, 10*autoSizeScaleY, 240*autoSizeScaleX, 240*autoSizeScaleX);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rectThhee];
        _shapeLayer.path = path.CGPath;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 20*autoSizeScaleX;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        [bjTwo.layer addSublayer:_shapeLayer];
        CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*1.5);bjTwo.transform = transform;
        gradientLayer.mask = _shapeLayer;
        
        
        
        
    }
    return self;

}
@end
