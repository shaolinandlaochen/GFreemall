//
//  GoodsDetailsHTMLContextViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GoodsDetailsHTMLContextViewController.h"

@interface GoodsDetailsHTMLContextViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
}

@end

@implementation GoodsDetailsHTMLContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.delegate=self;
    _scrollView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _scrollView.frame=self.view.bounds;
    [self.view addSubview:_scrollView];
    _scrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
   
    
    
    
    UIImageView * _imgbj=[[UIImageView alloc]init];
    [_scrollView addSubview:_imgbj];
    _imgbj.sd_layout.leftSpaceToView(_scrollView,0).topSpaceToView(_scrollView,0).rightSpaceToView(_scrollView, 0);
    [_imgbj sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491027937842&di=782914026ab7fd22d94b9eeb8b41e7ca&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F13%2F37%2F61%2F16b1OOOPIC7a.jpg"] placeholderImage:[UIImage imageNamed:@""] options:(SDWebImageRetryFailed) completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        float proportion=self.view.frame.size.width/image.size.width;//根据屏幕大小算出比例
        _imgbj.sd_layout.heightIs(image.size.height*proportion);
        _scrollView.contentSize=CGSizeMake(0, image.size.height*proportion);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
