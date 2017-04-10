//
//  GFMViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GFMViewController.h"
@interface GFMViewController ()
{
    UIView *colorsView;
    CAGradientLayer *gradientLayer;
    UIView *ThreeButtonsAtTheBottom;
}
@end

@implementation GFMViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self CreateTheTopNavigationBar];
    
    

    
 
    // Do any additional setup after loading the view.
}
-(void)CreateTheTopNavigationBar{
    autoSize
    
    colorsView=[[UIView alloc]init];
    colorsView.frame=CGRectMake(0, 0, self.view.frame.size.width, 127*autoSizeScaleY);
    [self.view addSubview:colorsView];
    
    gradientLayer = [CAGradientLayer layer];
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
    
    //forwarding
    UIButton *forwardingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [forwardingBtn setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    [forwardingBtn addTarget:self action:@selector(onforwardingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [colorsView addSubview:forwardingBtn];
    forwardingBtn.sd_layout.rightSpaceToView(colorsView, 10*autoSizeScaleX).bottomSpaceToView(colorsView, 10*autoSizeScaleY).widthIs(68*autoSizeScaleX).heightIs(68*autoSizeScaleY);
    
}
-(void)onCanceClick{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}
//转发
-(void)onforwardingBtnClick{

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
