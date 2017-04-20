//
//  ImageCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
       autoSize
        for (int i=0; i<3; i++) {
            float x=WIDTH-(24*autoSizeScaleX);
            float xx=x/3;
            float xxx=0+(xx+(12*autoSizeScaleX))*(i%3);
            UIView *views=[[UIView alloc]init];
            views.backgroundColor=[UIColor whiteColor];
            views.tag=i+1;
            [self.contentView addSubview:views];
            views.sd_layout.leftSpaceToView(self.contentView, xxx).topSpaceToView(self.contentView, 0).widthIs(xx).heightIs(215*autoSizeScaleY);
            
            float widthsss=xx-(126*autoSizeScaleX);
            MyButton *img=[[MyButton alloc]init];
            img.tag=i+100;
            [views addSubview:img];
            img.sd_layout.leftSpaceToView(views, widthsss/2).topSpaceToView(views, 18*autoSizeScaleY).widthIs(126*autoSizeScaleX).heightIs(126*autoSizeScaleY);
            
            UILabel *name=[[UILabel alloc]init];
            name.tag=i+200;
            name.textColor=[TheParentClass colorWithHexString:@"#292929"];
            name.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
            name.textAlignment=NSTextAlignmentCenter;
            [views addSubview:name];
            name.sd_layout.leftSpaceToView(views, 0).rightSpaceToView(views, 0).topSpaceToView(img, 12*autoSizeScaleY).heightIs(25*autoSizeScaleY);
            
            
            UILabel *pirce=[[UILabel alloc]init];
            pirce.tag=i+300;
            pirce.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            pirce.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
            pirce.textAlignment=NSTextAlignmentCenter;
            [views addSubview:pirce];
            pirce.sd_layout.leftSpaceToView(views, 0).rightSpaceToView(views, 0).topSpaceToView(name, 6*autoSizeScaleY).heightIs(25*autoSizeScaleY);
            
            
            
        }
        
        
        for (int i=0; i<2; i++) {
            float x=WIDTH-(12*autoSizeScaleX);
            float xx=x/2;
            float xxx=0+(xx+(12*autoSizeScaleX))*(i%2);
            
            
            UIView *views=[[UIView alloc]init];
            views.backgroundColor=[UIColor whiteColor];
            views.tag=i+4;
            [self.contentView addSubview:views];
            views.sd_layout.leftSpaceToView(self.contentView, xxx).topSpaceToView(self.contentView, 227*autoSizeScaleY).widthIs(xx).heightIs(328*autoSizeScaleY);
            
            float widthsss=xx-(208*autoSizeScaleX);
            MyButton *img=[[MyButton alloc]init];
            img.tag=i+103;
            [views addSubview:img];
            img.sd_layout.leftSpaceToView(views, widthsss/2).topSpaceToView(views, 18*autoSizeScaleY).widthIs(208*autoSizeScaleX).heightIs(208*autoSizeScaleY);
            
            UILabel *name=[[UILabel alloc]init];
            name.tag=i+203;
            name.textColor=[TheParentClass colorWithHexString:@"#292929"];
            name.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
            name.textAlignment=NSTextAlignmentCenter;
            [views addSubview:name];
            name.sd_layout.leftSpaceToView(views, 0).rightSpaceToView(views, 0).topSpaceToView(img, 20*autoSizeScaleY).heightIs(30*autoSizeScaleY);
            
            
            UILabel *pirce=[[UILabel alloc]init];
            pirce.tag=i+303;
            pirce.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            pirce.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
            pirce.textAlignment=NSTextAlignmentCenter;
            [views addSubview:pirce];
            pirce.sd_layout.leftSpaceToView(views, 0).rightSpaceToView(views, 0).topSpaceToView(name, 10*autoSizeScaleY).heightIs(30*autoSizeScaleY);
            
            
        }
        
        UIView *vvv=(UIView *)[self.contentView viewWithTag:5];
        [self setupAutoHeightWithBottomView:vvv bottomMargin:12*autoSizeScaleY];
        
        
        
    }
    return self;
}
-(void)setModel:(NSDictionary *)model{
    HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:model];
    
    for (int i=0; i<class.recommend.count; i++) {
        if (i<5) {
            HomeRecommend *recommend=class.recommend[i];
            [((MyButton *)[((UIView *)[self.contentView viewWithTag:i+1]) viewWithTag:i+100]) sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,recommend.commodityImagesPath,recommend.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
            ((UILabel *)[((UIView *)[self.contentView viewWithTag:i+1]) viewWithTag:i+200]).text=recommend.commodityName;
            ((UILabel *)[((UIView *)[self.contentView viewWithTag:i+1]) viewWithTag:i+300]).text=[NSString stringWithFormat:@"¥%.2f",recommend.commoditySellprice];
            
        }
        
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
