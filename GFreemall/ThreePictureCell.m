//
//  ThreePictureCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ThreePictureCell.h"

@implementation ThreePictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        self.contentView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        _oneBtn=[[MyButton alloc]init];
        _oneBtn.tag=1;
        [self.contentView addSubview:_oneBtn];
        _oneBtn.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).widthIs(431*autoSizeScaleX).heightIs(555*autoSizeScaleY);
        
        _twoBtn=[[MyButton alloc]init];
        _twoBtn.tag=2;
        _twoBtn.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_twoBtn];
        _twoBtn.sd_layout.leftSpaceToView(_oneBtn,12*autoSizeScaleX).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(272*autoSizeScaleY);
        
        UIImageView *imgOne=[[UIImageView alloc]init];
        imgOne.tag=1;
        [_twoBtn addSubview:imgOne];
        imgOne.sd_layout.leftSpaceToView(_twoBtn, 66*autoSizeScaleX).topSpaceToView(_twoBtn, 10*autoSizeScaleY).widthIs(174*autoSizeScaleX).heightIs(174*autoSizeScaleX);
        
        //商品1
        _nameOne=[[UILabel alloc]init];
        _nameOne.tag=2;
        _nameOne.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameOne.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameOne.textAlignment=NSTextAlignmentCenter;
        [_twoBtn addSubview:_nameOne];
        _nameOne.sd_layout.leftSpaceToView(_twoBtn, 0).topSpaceToView(imgOne, 15*autoSizeScaleY).rightSpaceToView(_twoBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品1
        _picOne=[[UILabel alloc]init];
        _picOne.tag=3;
        _picOne.textAlignment=NSTextAlignmentCenter;
        _picOne.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picOne.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        [_twoBtn addSubview:_picOne];
        _picOne.sd_layout.leftSpaceToView(_twoBtn, 0).topSpaceToView(_nameOne, 1*autoSizeScaleY).rightSpaceToView(_twoBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        
        
        
        
        _threeBtn=[[MyButton alloc]init];
        _threeBtn.backgroundColor=[UIColor whiteColor];
        _threeBtn.tag=3;
        [self.contentView addSubview:_threeBtn];
        _threeBtn.sd_layout.leftEqualToView(_twoBtn).topSpaceToView(_twoBtn,12*autoSizeScaleY).rightSpaceToView(self.contentView, 0).bottomEqualToView(_oneBtn);
        
        UIImageView *imgThree=[[UIImageView alloc]init];
        imgThree.tag=1;
        [_threeBtn addSubview:imgThree];
        imgThree.sd_layout.leftSpaceToView(_threeBtn, 66*autoSizeScaleX).topSpaceToView(_threeBtn, 10*autoSizeScaleY).widthIs(174*autoSizeScaleX).heightIs(174*autoSizeScaleX);
        
        //商品2
        _nameTwo=[[UILabel alloc]init];
        _nameTwo.tag=2;
        _nameTwo.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameTwo.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameTwo.textAlignment=NSTextAlignmentCenter;
        [_threeBtn addSubview:_nameTwo];
        _nameTwo.sd_layout.leftSpaceToView(_threeBtn, 0).topSpaceToView(imgThree, 15*autoSizeScaleY).rightSpaceToView(_threeBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品2
        _picTwo=[[UILabel alloc]init];
        _picTwo.tag=3;
        _picTwo.textAlignment=NSTextAlignmentCenter;
        _picTwo.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picTwo.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        [_threeBtn addSubview:_picTwo];
        _picTwo.sd_layout.leftSpaceToView(_threeBtn, 0).topSpaceToView(_nameTwo, 1*autoSizeScaleY).rightSpaceToView(_threeBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        float xx=WIDTH/2;
        float xxxx=xx-(12*autoSizeScaleX);
        
        _fourBtn=[[MyButton alloc]init];
        _fourBtn.backgroundColor=[UIColor whiteColor];
        _fourBtn.tag=3;
        [self.contentView addSubview:_fourBtn];
        _fourBtn.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(_oneBtn, 12*autoSizeScaleY).widthIs(xxxx).heightIs(328*autoSizeScaleY);
        
        UIImageView *imgFour=[[UIImageView alloc]init];
        imgFour.tag=1;
        [_fourBtn addSubview:imgFour];
        imgFour.sd_layout.leftSpaceToView(_fourBtn, (xxxx-(208*autoSizeScaleX))/2).topSpaceToView(_fourBtn, 22*autoSizeScaleY).widthIs(208*autoSizeScaleX).heightIs(208*autoSizeScaleX);
        
        //商品3
        _nameFour=[[UILabel alloc]init];
        _nameFour.tag=2;
        _nameFour.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameFour.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameFour.textAlignment=NSTextAlignmentCenter;
        [_fourBtn addSubview:_nameFour];
        _nameFour.sd_layout.leftSpaceToView(_fourBtn, 0).topSpaceToView(imgFour, 20*autoSizeScaleY).rightSpaceToView(_fourBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品3
        _picFour=[[UILabel alloc]init];
        _picFour.tag=3;
        _picFour.textAlignment=NSTextAlignmentCenter;
        _picFour.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picFour.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        [_fourBtn addSubview:_picFour];
        _picFour.sd_layout.leftSpaceToView(_fourBtn, 0).topSpaceToView(_nameFour, 10*autoSizeScaleY).rightSpaceToView(_fourBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        
        
        
        
        
        
        
        
        
        _fiveBtn=[[MyButton alloc]init];
        _fiveBtn.tag=3;
        _fiveBtn.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_fiveBtn];
        _fiveBtn.sd_layout.leftSpaceToView(_fourBtn, 12*autoSizeScaleX).topEqualToView(_fourBtn).rightSpaceToView(self.contentView, 0).heightIs(328*autoSizeScaleY);
        
        UIImageView *imgfive=[[UIImageView alloc]init];
        imgfive.tag=1;
        [_fiveBtn addSubview:imgfive];
        imgfive.sd_layout.leftSpaceToView(_fiveBtn, (xxxx-(208*autoSizeScaleX))/2).topSpaceToView(_fiveBtn, 22*autoSizeScaleY).widthIs(208*autoSizeScaleX).heightIs(208*autoSizeScaleX);
        
        //商品4
        _namefive=[[UILabel alloc]init];
        _namefive.tag=2;
        _namefive.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _namefive.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _namefive.textAlignment=NSTextAlignmentCenter;
        [_fiveBtn addSubview:_namefive];
        _namefive.sd_layout.leftSpaceToView(_fiveBtn, 0).topSpaceToView(imgfive, 20*autoSizeScaleY).rightSpaceToView(_fiveBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品4
        _picfive=[[UILabel alloc]init];
        _picfive.tag=3;
        _picfive.textAlignment=NSTextAlignmentCenter;
        _picfive.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picfive.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        [_fiveBtn addSubview:_picfive];
        _picfive.sd_layout.leftSpaceToView(_fiveBtn, 0).topSpaceToView(_namefive, 10*autoSizeScaleY).rightSpaceToView(_fiveBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        
        
        
        
        
        
        _sixBtn=[[MyButton alloc]init];
        _sixBtn.tag=3;
        _sixBtn.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_sixBtn];
        _sixBtn.sd_layout.leftEqualToView(_fourBtn).topSpaceToView(_fourBtn,12*autoSizeScaleY).widthIs(xxxx).heightIs(328*autoSizeScaleX);
        
        UIImageView *imgSix=[[UIImageView alloc]init];
        imgSix.tag=1;
        [_sixBtn addSubview:imgSix];
        imgSix.sd_layout.leftSpaceToView(_sixBtn, (xxxx-(208*autoSizeScaleX))/2).topSpaceToView(_sixBtn, 22*autoSizeScaleY).widthIs(208*autoSizeScaleX).heightIs(208*autoSizeScaleX);
        
        //商品5
        _nameSix=[[UILabel alloc]init];
        _nameSix.tag=2;
        _nameSix.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameSix.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameSix.textAlignment=NSTextAlignmentCenter;
        [_sixBtn addSubview:_nameSix];
        _nameSix.sd_layout.leftSpaceToView(_sixBtn, 0).topSpaceToView(imgSix, 20*autoSizeScaleY).rightSpaceToView(_sixBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品5
        _picSix=[[UILabel alloc]init];
        _picSix.tag=3;
        _picSix.textAlignment=NSTextAlignmentCenter;
        _picSix.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picSix.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        [_sixBtn addSubview:_picSix];
        _picSix.sd_layout.leftSpaceToView(_sixBtn, 0).topSpaceToView(_nameSix, 10*autoSizeScaleY).rightSpaceToView(_sixBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        
        
        
        
        
        
        
        _sevenBtn=[[MyButton alloc]init];
        _sevenBtn.tag=3;
        _sevenBtn.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_sevenBtn];
        _sevenBtn.sd_layout.leftEqualToView(_fiveBtn).topSpaceToView(_fiveBtn,12*autoSizeScaleY).rightSpaceToView(self.contentView, 0).bottomEqualToView(_sixBtn);
        
        UIImageView *imgSeven=[[UIImageView alloc]init];
        imgSeven.tag=1;
        [_sevenBtn addSubview:imgSeven];
        imgSeven.sd_layout.leftSpaceToView(_sevenBtn, (xxxx-(208*autoSizeScaleX))/2).topSpaceToView(_sevenBtn, 22*autoSizeScaleY).widthIs(208*autoSizeScaleX).heightIs(208*autoSizeScaleX);
        
        //商品6
        _nameSeven=[[UILabel alloc]init];
        _nameSeven.tag=2;
        _nameSeven.textColor=[TheParentClass colorWithHexString:@"#292929"];
        _nameSeven.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _nameSeven.textAlignment=NSTextAlignmentCenter;
        [_sevenBtn addSubview:_nameSeven];
        _nameSeven.sd_layout.leftSpaceToView(_sevenBtn, 0).topSpaceToView(imgSeven, 20*autoSizeScaleY).rightSpaceToView(_sevenBtn, 0).heightIs(30*autoSizeScaleY);
        
        //商品6
        _picSeven=[[UILabel alloc]init];
        _picSeven.tag=3;
        _picSeven.textAlignment=NSTextAlignmentCenter;
        _picSeven.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        _picSeven.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        [_sevenBtn addSubview:_picSeven];
        _picSeven.sd_layout.leftSpaceToView(_sevenBtn, 0).topSpaceToView(_nameSeven, 10*autoSizeScaleY).rightSpaceToView(_sevenBtn, 0).heightIs(30*autoSizeScaleY);
        
        
        
          [self setupAutoHeightWithBottomView:_sevenBtn bottomMargin:12*autoSizeScaleY];
        
    }
    return self;
}
-(void)setModel:(NSDictionary *)model{
autoSize
    HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:model];
    HomeAd6 *ad6=class.ads.ad6;
    [_oneBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",class.imgSrc,ad6.adsImages]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
    for (int i=0; i<class.news.count; i++) {
        HomeNews *news=class.news[i];
        if (i<6) {
            switch (i) {
                case 0:
                {
                    UIImageView *img=(UIImageView *)[_twoBtn viewWithTag:1];
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,news.commodityImagesPath,news.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
                    _nameOne.text=news.commodityName;
                    _picOne.text=[NSString stringWithFormat:@"¥%.2f",news.commoditySellprice];
                    
                }
                    break;
                case 1:
                {
                    UIImageView *img=(UIImageView *)[_threeBtn viewWithTag:1];
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,news.commodityImagesPath,news.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
                    _nameTwo.text=news.commodityName;
                    _picTwo.text=[NSString stringWithFormat:@"¥%.2f",news.commoditySellprice];
                    
                }
                    break;
                case 2:
                {
                    UIImageView *img=(UIImageView *)[_fourBtn viewWithTag:1];
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,news.commodityImagesPath,news.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
                    _nameFour.text=news.commodityName;
                    _picFour.text=[NSString stringWithFormat:@"¥%.2f",news.commoditySellprice];
                    
                }
                    break;
                case 3:
                {
                    UIImageView *img=(UIImageView *)[_fiveBtn viewWithTag:1];
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,news.commodityImagesPath,news.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
                    _namefive.text=news.commodityName;
                    _picfive.text=[NSString stringWithFormat:@"¥%.2f",news.commoditySellprice];
                    
                }
                    break;
                case 4:
                {
                    UIImageView *img=(UIImageView *)[_sixBtn viewWithTag:1];
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,news.commodityImagesPath,news.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
                    _nameSix.text=news.commodityName;
                    
                    _picSix.text=[NSString stringWithFormat:@"¥%.2f",news.commoditySellprice];
                    
                }
                    break;
                case 5:
                {
                    UIImageView *img=(UIImageView *)[_sevenBtn viewWithTag:1];
                    [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,news.commodityImagesPath,news.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
                    _nameSeven.text=news.commodityName;
                    _picSeven.text=[NSString stringWithFormat:@"¥%.2f",news.commoditySellprice];
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
    }
//    if (class.news.count<3&&class.news.count>0) {
//        [self setupAutoHeightWithBottomView:_threeBtn bottomMargin:12*autoSizeScaleY];
//    }else if (class.news.count>2&&class.news.count<5){
//      [self setupAutoHeightWithBottomView:_fourBtn bottomMargin:12*autoSizeScaleY];
//    }else if(class.news.count>4&&class.news.count<7){
//     [self setupAutoHeightWithBottomView:_sixBtn bottomMargin:12*autoSizeScaleY];
//    }


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
