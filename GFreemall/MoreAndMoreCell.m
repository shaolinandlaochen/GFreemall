//
//  MoreAndMoreCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MoreAndMoreCell.h"

@implementation MoreAndMoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _btn=[[MyButton alloc]init];
        [self.contentView addSubview:_btn];
        _btn.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(328*autoSizeScaleY);
        _line=[[UIView alloc]init];
        _line.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:_line];
        _line.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(0.1).topSpaceToView(_btn, 0);
        for (int i=0; i<30; i++) {

            
            float y=0+(250+138)*(i/3);
            float x=0+(250+0)*(i%3);
            
            MyButton *img=[[MyButton alloc]init];
            img.tag=i+100;
            [self.contentView addSubview:img];
            img.sd_layout.leftSpaceToView(self.contentView, x*autoSizeScaleX).topSpaceToView(_btn, (y+18)*autoSizeScaleY).widthIs(250*autoSizeScaleX).heightIs(250*autoSizeScaleY);
            
            UILabel *name=[[UILabel alloc]init];
            name.tag=i+200;
            name.textColor=[TheParentClass colorWithHexString:@"#292929"];
            name.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
            name.textAlignment=NSTextAlignmentCenter;
            [self.contentView addSubview:name];
            name.sd_layout.leftEqualToView(img).rightEqualToView(img).topSpaceToView(img, 14*autoSizeScaleY).heightIs(30*autoSizeScaleY);
            
            
            UILabel *pirce=[[UILabel alloc]init];
            pirce.tag=i+300;
            pirce.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            pirce.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
            pirce.textAlignment=NSTextAlignmentCenter;
            [self.contentView addSubview:pirce];
            pirce.sd_layout.leftEqualToView(img).rightEqualToView(img).topSpaceToView(name, 24*autoSizeScaleY).heightIs(30*autoSizeScaleY);
            
            
            
        }
      
        
        
    }
    return self;
}
-(void)onButtonClick:(UIButton *)btn{

}

-(void)setModel:(NSDictionary *)model{
    autoSize
    HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:model];
    HomeAd7 *ad7=class.ads.ad7;
    [_btn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",class.imgSrc,ad7.adsImages]] forState:UIControlStateNormal];

        for (int i=0; i<class.hot.count; i++) {
            HomeHot *hot=class.hot[i];
            [((MyButton *)[self.contentView viewWithTag:i+100]) sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,hot.commodityImagesPath,hot.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
            
            ((UILabel *)[self.contentView viewWithTag:i+200]).text=hot.commodityName;
            ((UILabel *)[self.contentView viewWithTag:i+300]).text=[NSString stringWithFormat:@"%.2f",hot.commoditySellprice];
            
            
        }

    
    float hang=class.hot.count/3.0;
    int count=[[NSString stringWithFormat:@"%.0f",hang]intValue];
    float height;
    if (count<hang) {
        height=(379*count)+(379);
    }else{
        height=379*count;
        
    }
    
   // NSLog(@"hot.count==%ld  hang==%f  count==%d  height==%f",class.hot.count,hang,count,height);
    
    [_delegatte cellHeight:(height+348)*autoSizeScaleY];


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
