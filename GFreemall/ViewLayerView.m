//
//  ViewLayerView.m
//  GFreemall
//
//  Created by 123 on 2017/4/13.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ViewLayerView.h"
#import "DrawACircle.h"
@implementation ViewLayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
{
    DrawACircle *quanBjView;

}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        autoSize
        _prompt=[[UIView alloc]init];
        _prompt.backgroundColor=[TheParentClass colorWithHexString:@"#ffdfdf"];
        [self addSubview:_prompt];
        _prompt.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(100*autoSizeScaleY);
        
        UIImageView *imgPrompt=[[UIImageView alloc]init];
        imgPrompt.image=[UIImage imageNamed:@"icon_tip"];
        [_prompt addSubview:imgPrompt];
        imgPrompt.sd_layout.leftSpaceToView(_prompt, 24*autoSizeScaleX).topSpaceToView(_prompt, 24*autoSizeScaleY).widthIs(32*autoSizeScaleX).heightIs(32*autoSizeScaleY);
        
        _tipStr=[[UILabel alloc]init];
        _tipStr.textColor=[TheParentClass colorWithHexString:@"#6e6e6e"];
        _tipStr.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
        _tipStr.numberOfLines=0;
        _tipStr.text=@"水电费水电费水电费水电费水电费水电费水电费水电费水电费是否";
        [_prompt addSubview:_tipStr];
        _tipStr.sd_layout.leftSpaceToView(imgPrompt, 15*autoSizeScaleX).rightSpaceToView(_prompt, 25*autoSizeScaleX).topEqualToView(imgPrompt).autoHeightRatio(0);
        
        
        
        quanBjView =[[DrawACircle alloc]init];
        [self addSubview:quanBjView];
        quanBjView.sd_layout.leftSpaceToView(self, 225*autoSizeScaleX).topSpaceToView(_prompt, 10*autoSizeScaleY).rightSpaceToView(self, 225*autoSizeScaleX).heightIs(300*autoSizeScaleY);
        
        _percentage=[[UILabel alloc]init];
        _percentage.textColor=[TheParentClass colorWithHexString:@"#000000"];
        _percentage.font=[UIFont systemFontOfSize:65*autoSizeScaleY];
        _percentage.textAlignment=NSTextAlignmentCenter;
        _percentage.text=@"75%";
        [quanBjView addSubview:_percentage];
        _percentage.sd_layout.leftSpaceToView(quanBjView, 0).rightSpaceToView(quanBjView, 0).topSpaceToView(quanBjView, 108*autoSizeScaleY).autoHeightRatio(0);
        
        UILabel *progressStr=[[UILabel alloc]init];
        progressStr.textColor=[TheParentClass colorWithHexString:@"#999999"];
        progressStr.font=[UIFont systemFontOfSize:22*autoSizeScaleY];
        progressStr.textAlignment=NSTextAlignmentCenter;
        progressStr.text=Localized(@"进阶进度");
        [quanBjView addSubview:progressStr];
        progressStr.sd_layout.leftEqualToView(_percentage).rightEqualToView(_percentage).topSpaceToView(_percentage, 18*autoSizeScaleY).autoHeightRatio(0);
        
        
        _number=[[UILabel alloc]init];
        _number.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
        _number.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _number.textAlignment=NSTextAlignmentCenter;
        _number.text=@"123456";
        _number.layer.cornerRadius = 20*autoSizeScaleX;
        _number.layer.masksToBounds = 20*autoSizeScaleX;
        _number.backgroundColor=[TheParentClass colorWithHexString:@"f19d40"];
        [self addSubview:_number];
        _number.sd_layout.leftSpaceToView(self, 295*autoSizeScaleX).rightSpaceToView(self, 295*autoSizeScaleX).topSpaceToView(quanBjView, 10*autoSizeScaleY).heightIs(42*autoSizeScaleY);
        
    
        
         NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"耗时24天0时24分"];
         [str addAttribute:NSForegroundColorAttributeName value:[TheParentClass colorWithHexString:@"#292929"] range:NSMakeRange(0,2)];
         [str addAttribute:NSForegroundColorAttributeName value:[TheParentClass colorWithHexString:@"#e61f5b"] range:NSMakeRange(2,4)];
        // [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(5,8)];
//         [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:30.0] range:NSMakeRange(0, 5)];
//         [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:30.0] range:NSMakeRange(6, 12)];
//         [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:30.0] range:NSMakeRange(19, 6)];
        
        
        _time=[[UILabel alloc]init];
        _time.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _time.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_time];
        _time.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_number, 38*autoSizeScaleY).autoHeightRatio(0);
        _time.attributedText = str;
        
        
        _BackgroundImage=[[UIImageView alloc]init];
        _BackgroundImage.userInteractionEnabled = YES;
        _BackgroundImage.image=[UIImage imageNamed:@"bg_erlun_touying"];
        [self addSubview:_BackgroundImage];
        _BackgroundImage.sd_layout.leftSpaceToView(self, 35*autoSizeScaleX).rightSpaceToView(self, 35*autoSizeScaleX).bottomSpaceToView(self, 35*autoSizeScaleY).topSpaceToView(_time, 33*autoSizeScaleY);
        
        
        //线
        UIImageView *lineImage=[[UIImageView alloc]init];
        lineImage.image=[UIImage imageNamed:@"line_dotted"];
        [_BackgroundImage addSubview:lineImage];
        lineImage.sd_layout.leftSpaceToView(_BackgroundImage, 10).topSpaceToView(_BackgroundImage, 255*autoSizeScaleY).rightSpaceToView(_BackgroundImage, 10).heightIs(1);
        
        
        
        
        _state=[[UILabel alloc]init];
        _state.textColor=[TheParentClass colorWithHexString:@"#e61f5b"];
        _state.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _state.text=Localized(@"正在进阶");
        [_BackgroundImage addSubview:_state];
        
        
        _currentLayer=[[UILabel alloc]init];
        _currentLayer.textColor=[TheParentClass colorWithHexString:@"#e61f5b"];
        _currentLayer.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _currentLayer.text=Localized(@"A层");
        [_BackgroundImage addSubview:_currentLayer];
        
        _beginTime=[[UILabel alloc]init];
        _beginTime.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _beginTime.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _beginTime.text=Localized(@"2017-02-31 12:51:01");
        [_BackgroundImage addSubview:_beginTime];
        
        _dataTime=[[UILabel alloc]init];
        _dataTime.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _dataTime.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _dataTime.text=Localized(@"2017-02-31 12:51:01");
        [_BackgroundImage addSubview:_dataTime];
        
        
        
        
        
        
        NSArray *nameArrays=@[@"进阶状态:",@"正在进阶:",@"开始时间:",@"目前时间:"];
        for (int i=0; i<nameArrays.count; i++) {
            float y=34+(27+26)*(i/1);
            UILabel *names=[[UILabel alloc]init];
            names.text=Localized(nameArrays[i]);
            names.textColor=[TheParentClass colorWithHexString:@"#999999"];
            names.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
            [_BackgroundImage addSubview:names];
            names.sd_layout.leftSpaceToView(_BackgroundImage, 34*autoSizeScaleX).widthIs(130*autoSizeScaleX).heightIs(28*autoSizeScaleY).topSpaceToView(_BackgroundImage, y*autoSizeScaleY);
            if (i==0) {
                _state.sd_layout.leftSpaceToView(names, 28*autoSizeScaleX).topEqualToView(names).rightSpaceToView(_BackgroundImage, 30*autoSizeScaleX).heightIs(28*autoSizeScaleY);
            }else if (i==1){
             _currentLayer.sd_layout.leftSpaceToView(names, 28*autoSizeScaleX).topEqualToView(names).rightSpaceToView(_BackgroundImage, 30*autoSizeScaleX).heightIs(28*autoSizeScaleY);
            }else if (i==2){
             _beginTime.sd_layout.leftSpaceToView(names, 28*autoSizeScaleX).topEqualToView(names).rightSpaceToView(_BackgroundImage, 30*autoSizeScaleX).heightIs(28*autoSizeScaleY);
            }else if (i==3){
             _dataTime.sd_layout.leftSpaceToView(names, 28*autoSizeScaleX).topEqualToView(names).rightSpaceToView(_BackgroundImage, 30*autoSizeScaleX).heightIs(28*autoSizeScaleY);
            }
            
        }
        
        
        _WhetherEarnings=[[UILabel alloc]init];
        _WhetherEarnings.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        _WhetherEarnings.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _WhetherEarnings.text=Localized(@"该轮已收益");
        [_BackgroundImage addSubview:_WhetherEarnings];
        _WhetherEarnings.sd_layout.leftSpaceToView(_BackgroundImage, 34*autoSizeScaleX).topSpaceToView(lineImage, 34*autoSizeScaleX).rightSpaceToView(_BackgroundImage, 34*autoSizeScaleX).autoHeightRatio(0);
        
        
        
        
        
        _freezeMoney=[[UILabel alloc]init];
        _freezeMoney.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _freezeMoney.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _freezeMoney.text=Localized(@"564641646546LC");
        [_BackgroundImage addSubview:_freezeMoney];
        
        
        
        
        _GFMMoney=[[UILabel alloc]init];
        _GFMMoney.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _GFMMoney.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        _GFMMoney.text=Localized(@"564641646546LC");
        [_BackgroundImage addSubview:_GFMMoney];
        
        
        
        
        NSArray *lblArray=@[@"GFM资产:",@"冻结资产:"];
        for (int i=0; i<2; i++) {
            UILabel *lbl=[[UILabel alloc]init];
            lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
            lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
            lbl.text=Localized(lblArray[i]);
            [_BackgroundImage addSubview:lbl];
            float y=26+(28+26)*(i/1);
            lbl.sd_layout.leftSpaceToView(_BackgroundImage, 34*autoSizeScaleX).topSpaceToView(_WhetherEarnings, y*autoSizeScaleY).heightIs(28*autoSizeScaleY).widthIs(130*autoSizeScaleX);
            
            if (i==0) {
                _freezeMoney.sd_layout.leftSpaceToView(lbl, 28*autoSizeScaleX).topEqualToView(lbl).rightSpaceToView(_BackgroundImage, 34*autoSizeScaleX).heightIs(28*autoSizeScaleY);
            }else if (i==1){
               _GFMMoney.sd_layout.leftSpaceToView(lbl, 28*autoSizeScaleX).topEqualToView(lbl).rightSpaceToView(_BackgroundImage, 34*autoSizeScaleX).heightIs(28*autoSizeScaleY);
            }
            
        }
        
        
        
        
        UIView *layerBJView=[[UIView alloc]init];
        layerBJView.layer.cornerRadius = 6*autoSizeScaleX;
        layerBJView.layer.masksToBounds = 6*autoSizeScaleX;
        [_BackgroundImage addSubview:layerBJView];
        layerBJView.sd_layout.leftSpaceToView(_BackgroundImage, 30*autoSizeScaleX).bottomSpaceToView(_BackgroundImage, 34*autoSizeScaleY).rightSpaceToView(_BackgroundImage, 30*autoSizeScaleX).heightIs(96*autoSizeScaleY);
        
        
        CAGradientLayer* gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)[TheParentClass colorWithHexString:@"#f19d40"].CGColor, (__bridge id)[TheParentClass colorWithHexString:@"#e61f5b"].CGColor];
        gradientLayer.locations = @[@0.1,@1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame =CGRectMake(0, 0, 604*autoSizeScaleY, 96*autoSizeScaleY);
        [layerBJView.layer addSublayer:gradientLayer];
        
        _ViewLayerButton=[[MyButton alloc]init];
        [_ViewLayerButton setTitle:Localized(@"查看层") forState:UIControlStateNormal];
        _ViewLayerButton.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
        _ViewLayerButton.layer.cornerRadius = 6*autoSizeScaleX;
        _ViewLayerButton.layer.masksToBounds = 6*autoSizeScaleX;
        [_ViewLayerButton setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [_BackgroundImage addSubview:_ViewLayerButton];
        _ViewLayerButton.sd_layout.leftSpaceToView(_BackgroundImage, 30*autoSizeScaleX).bottomSpaceToView(_BackgroundImage, 34*autoSizeScaleY).rightSpaceToView(_BackgroundImage, 30*autoSizeScaleX).heightIs(96*autoSizeScaleY);

       
        
        
        
        
        
    }
    return self;

}
//百分比圈圈
-(void)setQuanQuan:(float)quanQuan{
    quanBjView.shapeLayer.strokeEnd=quanQuan;

}
@end
