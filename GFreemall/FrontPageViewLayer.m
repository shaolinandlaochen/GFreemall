//
//  FrontPageViewLayer.m
//  GFreemall
//
//  Created by 123 on 2017/4/13.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "FrontPageViewLayer.h"
#import "ViewLayerView.h"
@interface FrontPageViewLayer ()<UIScrollViewDelegate>
{
    UIView * colorsView;
    UIScrollView *_scrollView;
    ViewLayerView *_oneView;//第一层
    ViewLayerView *_twoView;//第二层
    ViewLayerView *_threeView;//第三层
    NSInteger _page;
    
}
@end

@implementation FrontPageViewLayer
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    
}
-(void)CreateTheTopNavigationBar{
    autoSize
    
    colorsView=[[UIView alloc]init];
    colorsView.frame=CGRectMake(0, 0, self.view.frame.size.width, 127*autoSizeScaleY);
    [self.view addSubview:colorsView];
    
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[TheParentClass colorWithHexString:@"#f19d40"].CGColor, (__bridge id)[TheParentClass colorWithHexString:@"#e61f5b"].CGColor];
    gradientLayer.locations = @[@0.1,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, 127*autoSizeScaleY);
    [colorsView.layer addSublayer:gradientLayer];
    
    
    UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(onCanceClick) forControlEvents:UIControlEventTouchUpInside];
    [colorsView addSubview:cancelBtn];
    cancelBtn.sd_layout.leftSpaceToView(colorsView, 10*autoSizeScaleX).bottomSpaceToView(colorsView, 10*autoSizeScaleY).widthIs(68*autoSizeScaleX).heightIs(68*autoSizeScaleY);
    NSArray *nameArray=@[@"一轮",@"二轮",@"三轮"];
    for (int i=0; i<3; i++) {
        MyButton *btn=[[MyButton alloc]init];
        btn.tag=i+1;
        [btn setTitle:Localized(nameArray[i]) forState:UIControlStateNormal];
        
        [btn setTitleColor:[[TheParentClass colorWithHexString:@"#ffffff"]colorWithAlphaComponent:0.5] forState:UIControlStateNormal];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateSelected];
        btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        if (i==0) {
            btn.selected=YES;
        }
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [colorsView addSubview:btn];
        float x=220+(70+50)*(i%3);
        btn.sd_layout.leftSpaceToView(colorsView, x*autoSizeScaleX).topSpaceToView(colorsView, 70*autoSizeScaleY).widthIs(70*autoSizeScaleX).heightIs(35*autoSizeScaleY);
        
        
        
        UILabel *lblLine=[[UILabel alloc]init];
        lblLine.backgroundColor=[UIColor clearColor];
        if (i==0) {
            lblLine.backgroundColor=[UIColor whiteColor];
        }
        lblLine.tag=i+5;
        [colorsView addSubview:lblLine];
        lblLine.sd_layout.leftSpaceToView(colorsView, x*autoSizeScaleX).bottomSpaceToView(colorsView, 0*autoSizeScaleY).widthIs(70*autoSizeScaleX).heightIs(2);
        
    }
    
    
}
cancelClick
#pragma mark 点击顶部按钮执行该方法
-(void)onButtonClick:(MyButton *)btn{
    
    for (int i=0; i<3; i++) {
        MyButton *button=(MyButton *)[colorsView viewWithTag:i+1];
        UILabel *lbl=(UILabel *)[colorsView viewWithTag:i+5];
        
        if (i+1==btn.tag) {
            button.selected=YES;
            lbl.backgroundColor=[UIColor whiteColor];
        }else{
            button.selected=NO;
            lbl.backgroundColor=[UIColor clearColor];
        }
        
        
    }
  
    _page=btn.tag-1;
    CGPoint position = CGPointMake(_page*self.view.frame.size.width, 0);
    [_scrollView setContentOffset:position animated:YES];

}
- (void) scrollViewDidScroll:(UIScrollView *)sender {
    // 得到每页宽度
    CGFloat pageWidth = sender.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (currentPage!=_page) {//然后再改变上面按钮的大小以及红条的坐标
        _page=currentPage;
        
    }
    
}
//结束滚动时执行该方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    for (int i=0; i<3; i++) {
        MyButton *button=(MyButton *)[colorsView viewWithTag:i+1];
        UILabel *lbl=(UILabel *)[colorsView viewWithTag:i+5];
        
        if (i==_page) {
            button.selected=YES;
            lbl.backgroundColor=[UIColor whiteColor];
        }else{
            button.selected=NO;
            lbl.backgroundColor=[UIColor clearColor];
        }
        
        
    }
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _page=0;
    [self CreateTheTopNavigationBar];
    [self CreateAView];
    // Do any additional setup after loading the view.
}
-(void)CreateAView{
autoSize
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _scrollView.delegate=self;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    _scrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).topSpaceToView(colorsView, 0);
    _scrollView.contentSize=CGSizeMake(self.view.frame.size.width*3, 0);
    
    
    _oneView=[[ViewLayerView alloc]init];
    _oneView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _oneView.quanQuan=0.75;
    [_oneView.ViewLayerButton addTarget:self action:@selector(onViewLayerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_oneView];
    _oneView.sd_layout.leftSpaceToView(_scrollView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    
    
    _twoView=[[ViewLayerView alloc]init];
    _twoView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _twoView.quanQuan=0.65;
    [_scrollView addSubview:_twoView];
    _twoView.sd_layout.leftSpaceToView(_oneView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    
    
    
    _threeView=[[ViewLayerView alloc]init];
    _threeView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _threeView.quanQuan=0.45;
    [_scrollView addSubview:_threeView];
    _threeView.sd_layout.leftSpaceToView(_twoView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    
    
    

}
//点击查看层
-(void)onViewLayerButtonClick:(MyButton *)btn{
    NSLog(@"aaaaaa");
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
