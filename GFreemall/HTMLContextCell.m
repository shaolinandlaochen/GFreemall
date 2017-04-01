//
//  HTMLContextCell.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "HTMLContextCell.h"

@implementation HTMLContextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        autoSize
        _imgbj=[[UIImageView alloc]init];
        [self.contentView addSubview:_imgbj];
        _imgbj.sd_layout.leftSpaceToView(self.contentView,0).topSpaceToView(self.contentView,0).rightSpaceToView(self.contentView, 0);

        
        
    }
    return self;
}
-(void)setWidth:(float)width{
    [_imgbj sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491027937842&di=782914026ab7fd22d94b9eeb8b41e7ca&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F13%2F37%2F61%2F16b1OOOPIC7a.jpg"] placeholderImage:[UIImage imageNamed:@""] options:(SDWebImageRetryFailed) completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        float proportion=width/image.size.width;//根据屏幕大小算出比例
        _imgbj.sd_layout.heightIs(image.size.height*proportion);
        [_delegate htmlHeight:image.size.height*proportion];
    }];


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
